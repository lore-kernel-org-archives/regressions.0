Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C382C2566
	for <regressions@lists.linux.dev>; Wed, 22 Mar 2023 12:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A80C433D2;
	Wed, 22 Mar 2023 12:09:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Ingdh26u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1679486960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cvY46fd0vZ13Q/NmQURfWfLe6EF0yiYVFhbjH7fFs7M=;
	b=Ingdh26uTgL+AN1fOvu35JFST2YniG3PTzJicWjc5W9yyYF2h60NUnVJR9UbDD2TPUGlAp
	u8i7dV2T/DOrIM8ICunWgluYNu4zVTlXuvh19Hgs6mw27Ysq1OCE0mSnSr2G/4YPV193zm
	jQbSRUFloY7TwDg99rgsNfJ3CCs+oXY=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3165d7c0 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 22 Mar 2023 12:09:20 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	regressions@leemhuis.info,
	regressions@lists.linux.dev
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] riscv: require alternatives framework when selecting FPU support
Date: Wed, 22 Mar 2023 13:09:07 +0100
Message-Id: <20230322120907.2968494-1-Jason@zx2c4.com>
In-Reply-To: <ZBruFRwt3rUVngPu@zx2c4.com>
References: <ZBruFRwt3rUVngPu@zx2c4.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When moving switch_to's has_fpu() over to using riscv_has_extension_
likely() rather than static branchs, the FPU code gained a dependency on
the alternatives framework. If CONFIG_RISCV_ALTERNATIVE isn't selected
when CONFIG_FPU is, then has_fpu() returns false, and switch_to does not
work as intended. So select CONFIG_RISCV_ALTERNATIVE when CONFIG_FPU is
selected.

Fixes: 702e64550b12 ("riscv: fpu: switch has_fpu() to riscv_has_extension_likely()")
Link: https://lore.kernel.org/all/ZBruFRwt3rUVngPu@zx2c4.com/
Cc: Jisheng Zhang <jszhang@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c5e42cc37604..0f59350c699d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -467,6 +467,7 @@ config TOOLCHAIN_HAS_ZIHINTPAUSE
 config FPU
 	bool "FPU support"
 	default y
+	select RISCV_ALTERNATIVE
 	help
 	  Say N here if you want to disable all floating-point related procedure
 	  in the kernel.
-- 
2.40.0

