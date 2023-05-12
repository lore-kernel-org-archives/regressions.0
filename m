Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8188B1DDF5
	for <regressions@lists.linux.dev>; Fri, 12 May 2023 13:46:05 +0000 (UTC)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id D1773206FF
	for <regressions@lists.linux.dev>; Fri, 12 May 2023 15:46:02 +0200 (CEST)
Date: Fri, 12 May 2023 15:45:59 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Linux Regressions <regressions@lists.linux.dev>
Subject: Re: USB gadget regression on v6.4-rc1 and v6.1.28
Message-ID: <ZF5DF0GOKuxQeKc0@francesco-nb.int.toradex.com>
References: <ZF4BvgsOyoKxdPFF@francesco-nb.int.toradex.com>
 <ZF4bMptC3Lf2Hnee@gerhold.net>
 <ZF4kBJEKDy5T39sj@francesco-nb.int.toradex.com>
 <ZF4lqka+PxjHAlrh@francesco-nb.int.toradex.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZF4lqka+PxjHAlrh@francesco-nb.int.toradex.com>

On Fri, May 12, 2023 at 01:40:26PM +0200, Francesco Dolcini wrote:
> #regzbot introduced: 0db213ea8eed
> #regzbot introduced: v6.4-rc1
> #regzbot introduced: v6.1.28
> #regzbot title: USB gadget hangs forever

It looks like I am not really understanding how this works ... let me
try again.

#regzbot introduced: 0db213ea8eed
#regzbot monitor: https://lore.kernel.org/all/20230512131435.205464-1-francesco@dolcini.it/
#regzbot monitor: https://lore.kernel.org/all/ZF4BvgsOyoKxdPFF@francesco-nb.int.toradex.com/

