Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEA7ED1
	for <regressions@lists.linux.dev>; Sun, 10 Apr 2022 09:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 804176081103;
	Sun, 10 Apr 2022 11:33:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 0I2AQ11rsG8P; Sun, 10 Apr 2022 11:33:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0882A6081105;
	Sun, 10 Apr 2022 11:33:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id TrnisQUZSPhL; Sun, 10 Apr 2022 11:33:33 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C487C6081103;
	Sun, 10 Apr 2022 11:33:33 +0200 (CEST)
Date: Sun, 10 Apr 2022 11:33:33 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Zhen Lei <thunder.leizhen@huawei.com>, Jeff Dike <jdike@addtoit.com>, 
	anton ivanov <anton.ivanov@cambridgegreys.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Eduard-Gabriel Munteanu <maxdamage@aladin.ro>, 
	linux-um <linux-um@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, 
	regressions@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Message-ID: <1087614384.239493.1649583213699.JavaMail.zimbra@nod.at>
In-Reply-To: <1b03d888-cea3-3e6f-087f-daeb5642a975@leemhuis.info>
References: <20210508032239.2177-1-thunder.leizhen@huawei.com> <Yjt31seiNv18HYrf@dev-arch.thelio-3990X> <1b03d888-cea3-3e6f-087f-daeb5642a975@leemhuis.info>
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
Thread-Index: ceNsql/27C1J+1g3RguAZ58F1pmPwg==

----- Urspr=C3=BCngliche Mail -----
> Von: "Thorsten Leemhuis" <regressions@leemhuis.info>
> Hi, this is your Linux kernel regression tracker. Top-posting for once,
> to make this easily accessible to everyone.
>=20
> Zhen Lei, Richard, what's up here? Below regression report is more than
> two weeks old now and afaics didn't even get a single reply.

Sorry, but UML is leisure pursuit, so I can only work on it when my
schedule permits it.
=20
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>=20
> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
> reports on my table. I can only look briefly into most of them and lack
> knowledge about most of the areas they concern. I thus unfortunately
> will sometimes get things wrong or miss something important. I hope
> that's not the case here; if you think it is, don't hesitate to tell me
> in a public reply, it's in everyone's interest to set the public record
> straight.
>=20
>=20
>=20
> On 23.03.22 20:41, Nathan Chancellor wrote:

[...]

>> in case it helps. I am happy to provide more information or test patches
>> as necessary.

Nathan, can you provide me the error code from os_set_fd_block()?
My best guess is that setting the fd is optional here and UML does
not expect failure here.

Thanks,
//richard
