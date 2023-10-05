class PostsController < ApplicationController
    def index
        @posts = Post.all
    end
    def top
        @posts = Post.all
    end

    def new
        @post = Post.new
    end
    
    def show
        @post = Post.find(params[:id])
    end
    
    def create
        post = Post.new
        post.pointa = params[:q1].to_f + params[:q2].to_f + params[:q6].to_f
        post.pointb = params[:q1].to_f + params[:q5].to_f + params[:q7].to_f
        post.pointc = params[:q3].to_f + params[:q4].to_f + params[:q6].to_f

        pointa = post.pointa
        pointb = post.pointb
        pointc = post.pointc

        if pointa <= 0 && pointb <= 0 && pointc <=0
            post.genre = "ナイスガイ！"
        elsif pointa > pointb && pointa > pointc
            post.genre = "自己中心タイプ"
        elsif pointb > pointa && pointb > pointc
            post.genre = "彼女依存タイプ"
        elsif pointc > pointa && pointc > pointb
            post.genre = "洗脳タイプ"
        else
            post.genre = "問題児タイプ"
        end

        if post.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    private
    def post_params
        params.require(:post).permit(:pointa, :pointb, :pointc)
    end

end
