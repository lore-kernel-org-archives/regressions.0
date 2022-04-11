Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469231840
	for <regressions@lists.linux.dev>; Mon, 11 Apr 2022 18:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8331860F6B61;
	Mon, 11 Apr 2022 20:45:25 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 2Hw1TfcMpRAi; Mon, 11 Apr 2022 20:45:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 21C2960F6B73;
	Mon, 11 Apr 2022 20:45:25 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id c5DjqaO2bHEL; Mon, 11 Apr 2022 20:45:25 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id E091060F6B61;
	Mon, 11 Apr 2022 20:45:24 +0200 (CEST)
Date: Mon, 11 Apr 2022 20:45:24 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	Zhen Lei <thunder.leizhen@huawei.com>, Jeff Dike <jdike@addtoit.com>, 
	anton ivanov <anton.ivanov@cambridgegreys.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Eduard-Gabriel Munteanu <maxdamage@aladin.ro>, 
	linux-um <linux-um@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, 
	regressions <regressions@lists.linux.dev>
Message-ID: <1287561645.244713.1649702724736.JavaMail.zimbra@nod.at>
In-Reply-To: <YlRp9KR1mp3/4Txo@thelio-3990X>
References: <20210508032239.2177-1-thunder.leizhen@huawei.com> <Yjt31seiNv18HYrf@dev-arch.thelio-3990X> <1b03d888-cea3-3e6f-087f-daeb5642a975@leemhuis.info> <1087614384.239493.1649583213699.JavaMail.zimbra@nod.at> <YlRp9KR1mp3/4Txo@thelio-3990X>
Subject: Re: [PATCH 1/1] um: fix error return code in winch_tramp()
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: fix error return code in winch_tramp()
Thread-Index: U06xC3VNSbJwBqt91Rla1kwYc9mhWA==

----- Urspr=C3=BCngliche Mail -----
> Von: "Nathan Chancellor" <nathan@kernel.org>
> I attempted to print out the error code but it seems like there is no
> output in the console after "reboot: System halted". If I add an
> unconditional print right before the call to os_set_fd_block(), I see it
> during start up but I do not see it during shutdown. Is there some way
> to see that console output during shutdown?

I think in this case the easiest way is attaching gdb with a breakpoint.

Thanks,
//richard
