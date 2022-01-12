Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEFD2CA1
	for <regressions@lists.linux.dev>; Wed, 12 Jan 2022 18:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2604C36AEB;
	Wed, 12 Jan 2022 18:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642013179;
	bh=y7E/KHbXY9lpDr9BJopBY/ZaK8Sw/6qW+uDd883EaZw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=grA8tm3ZwKds1EIiKqtCf3TlNaPqLfG/uCrwsL6c6Oc0VUMD2ccdt/aCY6JOhVIgn
	 dgYH57FZ8um9HCr1r41b64B/yK0Lk38H5ojMyXinRBxno+uiFJjf9WOOn1ta1Z2fb8
	 vuJlr79zS4nYrv7ybXw0sr4M0iolZQBk5lzf5oMlg55FvISzB1oHF5RzS7gHMq8Ane
	 9OG7d8342r8n3DOkBzi8OvtFnmx8Ez8FQs5eWCUVn5AaJxc2qVq6IBXeZtiIGn2SIm
	 8DfrCEdacEm+O0j2+hwTPEbvCVN6AIt1tksAl/89Xa9LFmQbvuUM2uDiQPCZqrWfYj
	 xR9pvK4/u6x0Q==
Date: Wed, 12 Jan 2022 10:46:18 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: regressions@lists.linux.dev
Cc: ooppublic@163.com, davem@davemloft.net, dsahern@kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH] net: fix fragments have the disallowed options
Message-ID: <20220112104618.21ad3202@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20220107080559.122713-1-ooppublic@163.com>
References: <20220107080559.122713-1-ooppublic@163.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  7 Jan 2022 16:05:59 +0800 ooppublic@163.com wrote:
> From: caixf <ooppublic@163.com>
> 
> When in function ip_do_fragment() enter fsat path,
> if skb have opthons, all fragments will have the same options.
> 
> Just guarantee the second fragment not have the disallowed options.

#regzbot ^introduced: faf482ca196a5b16007190529b3b2dd32ab3f761
