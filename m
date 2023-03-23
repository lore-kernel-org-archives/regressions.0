Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5751A93A
	for <regressions@lists.linux.dev>; Thu, 23 Mar 2023 15:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF10C433D2;
	Thu, 23 Mar 2023 15:56:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="A63aMhce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1679586989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E0QDLAcWMz6ZWQvPCSBnzoIiYMLhelgbcARCDPPOWLE=;
	b=A63aMhceMeMggmWfc1r72fOX8m28q7eHiq1pPxSfpctedpOcSEfTjKEPc4NstDyZLL39NB
	zpVsWtSG/hAldFxNq52W742ew8XAvTrO6D29HZpCIGbCRQeHlN3L4e/e1vDfG4BcArU7gR
	0F+SzR1yMXW0XdwaIQSDwaxsPnj0ytQ=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a8981c54 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 23 Mar 2023 15:56:28 +0000 (UTC)
Date: Thu, 23 Mar 2023 16:56:24 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Jisheng Zhang <jszhang@kernel.org>, Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, regressions@leemhuis.info,
	regressions@lists.linux.dev
Subject: Re: [PATCH] riscv: require alternatives framework when selecting FPU
 support
Message-ID: <ZBx2qFFiaRSyJubo@zx2c4.com>
References: <ZBruFRwt3rUVngPu@zx2c4.com>
 <20230322120907.2968494-1-Jason@zx2c4.com>
 <20230322124631.7p67thzeblrawsqj@orel>
 <1884bd96-2783-4556-bc57-8b733758baff@spud>
 <20230322192610.sad42xau33ye5ayn@orel>
 <2a3b08ce-5ab1-41b6-ad58-edbeff7b1acb@spud>
 <ad445951-3d13-4644-94d9-e0989cda39c3@spud>
 <CAHmME9qEbUP7cq-iofN=ruSWhsHUva+qqavfEpNzDK_BjQVqxw@mail.gmail.com>
 <af690061-f962-498e-b2df-d2e6119292cf@spud>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <af690061-f962-498e-b2df-d2e6119292cf@spud>

On Thu, Mar 23, 2023 at 02:49:34PM +0000, Conor Dooley wrote:
> This would requiring picking up your patch Jason, but with an
> "if !XIP_KERNEL" added to the select.

So the risk of making this all work is that we wind up forgetting to add
`select alternatives if !xip` to various places that need it (fpu, kvm,
maybe others? future others?), because it appears to work, thanks to the
code in your patch.

But making it work is also probably a good thing, since we obviously
want the fpu and maybe other things to work on xip kernels.

So maybe we should get rid of the CONFIG_RISCV_ALTERNATIVES knob
entirely, making it "always enabled", and then conditonalize the
alternatives code to BUILD_BUG_ON when called with CONFIG_XIP_KERNEL=y.
Then, this build bug will get hit immediately by
riscv_has_extension_*(), which will then require your patch, which can
run in a `if (IS_ENABLED(XIP_KERNEL))` block or similar.

The result of that will be:
- !xip kernels properly use the fast riscv_has_extension_*() code and
  any alternatives code needed, since it's always selected.
- xip kernels get a BUILD_BUG_ON if they use any alternatives-based code
  that doesn't have a xip fallback yet.

What do you think of that approach?

A "lighter weight" version of that approach would be to just remove all of
the `select RISCV_ALTERNATIVES` lines, and instead make
RISCV_ALTERNATIVES specify `default !XIP_KERNEL`. That would more or
less amount to the above too, though with weirder error cases.

Jason
