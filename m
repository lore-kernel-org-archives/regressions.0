Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757611;
	b=X4FgL2z431Hw031mAT3Vo6zuHldb7b2Ua1pbzvpMZZeHRZ26zgRskd4otf3tNYMwRk1v
	 /WTt/RQDLCs2daA3m1DhpF+fNWFIRs2jPVI6yMbDlkrjXV16Kg9AVmK0pDXAquha1uHxL
	 9YXd8vawxYQUBe2mDEsfXBzei42q7Ny9WSGZAo959OqPv1JFEzdOyygXSElKeqyQ4N0SH
	 D3FENd/FtFpYvhRtxF6KVRjUmCaAqWnJO/eML/s980ULtQqyY2+Xt6qzSjgL0bWCIAnqN
	 uJPUl0r3EO8TnLp322X0zrHbYgmwk7GOcFSe8XlgEeYTig9j/lKY00bBsy14mqN+nfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wnqBY0Dj8JK3jWiYu+1DNG27SSaalJKsMIrKfhj2/yc=;
	b=dTaPzjA2gYQZSqa/9pt1Bu5gwRoESc6VMjCzRtyC5k1EZDQ/K+qRYKp1MUBgESIP13XQ
	 V640kGdqIh/190jhCMYhffdwb4PP7SZppfI8OPYm98UCDN6tWZk0NCujNI/2W7WOK6Pse
	 nJsxOuQzHm+PdyPeOnfHqr+pHpc3nG+tOWeX2B+iIfEKtHuE9JFlx0xCL2PErUA/J8z8A
	 +pOb+A9MqxPmjLUgXnWkLEMD9bahbK1blDVu2bTkifPEWJvTmPJiUFpYes+JQlUMeP0Ja
	 eYMNV00cu9eu8xFCauM/r4svvHXsPapbsQi3iess1oTcjCOD1RaFhTruEaRe2yqPkWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=G8WoAGMY;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D831D606A32E
	for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 12:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D831D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=G8WoAGMY
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so1132792a12.2
        for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 05:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792757609; x=1793362409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wnqBY0Dj8JK3jWiYu+1DNG27SSaalJKsMIrKfhj2/yc=;
        b=G8WoAGMYGKz28V97lh3mQgh/t2YxFX9asK8R/d0EHs3Otvm0iR+NL3nA+r6jITbzSQ
         2CNDaOKEFz6d8lUwnlJcsI9EKoc3lE3WCk3vuu+FrcMO0m1QbmxE8W2AtXM4p9IYktSL
         MrOUf8+/8xcLRK1h6RMtcozFUSOlovv5/WlWPblbG2OmuBjhaFKlV9Hm/N+hJ+131KSn
         vyKUg9cYxcCb38PJe5SIiRhZ0KpUKfz5F0OEWinrArIo/jyBB6WyT2jmR2KWNVlyz1zR
         Qh3tGdaXspPy4LGrjEASoW7KNgYNSygYg5Yrg6XTl5RNrZvRYUIAI9DlimuSQaajKqzy
         xudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792757609; x=1793362409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wnqBY0Dj8JK3jWiYu+1DNG27SSaalJKsMIrKfhj2/yc=;
        b=ZJUepJZhm3Q+tvcBY1uVpM28+PSW4kUnFVV/RtEgTMCc8aA3PDNn1KWlaZjxOwpchh
         lRYL3QOBy0adp1ScksHyhtAk73zq7hC6E6vTEV9ztoIPAZiRY2Ao3jcy+cJl11b44BdN
         jPfPigHJtguLpkRkME98qzrj3Jp4lIOojpoCZQvcokQ3Z10MHpt6dTr3GyzZoOb88yX+
         iLE+azG1A53jDKelAVeBH3x6mWD9dc0p9rQbp4uMKX6tfqJeKKNiZCx2n2HjA9Wp5Vec
         jo7tHUrDJ9jC8zqnmTez27Kcflu7aTIgI4wiwFb+9u90hz0SD5/LyaPulYcJ8KoqD6pz
         m1Mw==
X-Forwarded-Encrypted: i=1; AKwUvBwUxqa20lnIJLEMMM/Im+AAmj1SPD4rC5WsMQOb2yanhMqJVdxOFns0kCjQ9A6dg8QGEEx5WctBGYV+9Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYK7UekxQ/ebBTYGiNMcjYAnmSj+Cbaej2hUn4xXu+XtfQ4RQ4vR
	zGLGkLjxqXWO/N/4II9kTZyqFG7HBZvr0P179eshQoewZyrWUsLpFpfT
X-Gm-Gg: AYBFou3VTtBXRrNW99wRxteKqRoi1ileL2SuHB8oa5rDvSYC0w7Yf3PzVrq0+kqAoGa
	anNkT5KcH06KQ/qgKtgFSRH4ruyjYLuWdoDjSj2yYWFw6LQWgOgEAte9oxD416AMkw3F4b8l0Iv
	V8ftCP8LN0J9kUZSNm8Z96Ea7uZcw1xuMnFBMoqTDk4Re2ENoZR83w2FzbOqK+WbBI3m6jCh23b
	LrjpaooxDqS3EtjGk1Ns4xv36s2XuBNY3sM1FsT7P7ZYeo6mDlddiW49roMnZjWWn+5/H1U+jfv
	/0UV6E/Dr17TP+kDOaRDeZUoQVBtXnYKmuCHpb1JhxzP5xsuNtxr16s9k6eRvzB746wXvYsQRc/
	py5Ph74w/cau96IX4jkGkG9e1pS76f48xFXS4QUp7HaSGI8GYIxgbBpNaICONrmWhqg4zC0bpTG
	2Iy/j63KtAzPG/fTuAzBQsWLjfLgPcu36FGli/uClf2KS5Vzd2RVgEOEx3asMXo7EwsK2gdqFEQ
	EXnL/Xe8sDEIzmZpBcJNBLPdQrJe4Q0gyc+aQ7sMdnAjSyJoWjfJVU97pxIEf8+OxjUJNY=
X-Received: by 2002:a17:906:f598:b0:c31:8441:35ff with SMTP id a640c23a62f3a-c46a90fa068mr313874366b.48.1792757608969;
        Fri, 23 Oct 2026 05:13:28 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:47::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5ceb7efsm94688866b.73.2026.10.23.05.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:13:28 -0700 (PDT)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: netdev@vger.kernel.org
Cc: Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Jinqian Yang <yangjinqian1@huawei.com>,
	Andrew Preece <apreece@meta.com>,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] bnxt_en: Don't keep MSI-X vectors added before FW reserves them
Date: Fri, 23 Oct 2026 05:13:21 -0700
Message-ID: <20261023121321.2127263-1-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When dynamic MSI-X is supported, bnxt_check_rings() grows the MSI-X
vectors with bnxt_change_msix() once FW says the new rings would fit,
and keeps them.  FW only reserves the extra IRQs later, in
__bnxt_reserve_rings() on the following open.  The MSI-X table entries
beyond the function's reserved IRQs are not backed until then: the
MSI message written when the new vectors are activated is lost, and
the entries read back as zero.  After FW reserves them they are live
but still zero, so the NQ rings bound to them signal address 0 and
every completion on those rings is lost.  The next ring change (for
example ethtool -G) then times out freeing each of those rings and
the TX watchdog fires:

  bnxt_en 0002:01:00.0 eth0: Resp cmpl intr err msg: 0x51
  bnxt_en 0002:01:00.0 eth0: hwrm_ring_free type 1 failed. rc:fffffff0 err:0
  ...
  bnxt_en 0002:01:00.0 eth0: NETDEV WATCHDOG: CPU: 17: transmit queue 18 timed out 5716 ms

On x86 this is hidden: GENERIC_IRQ_RESERVATION_MODE makes the PCI MSI
domains MSI_FLAG_MUST_REACTIVATE, so the message is composed and
written again when the IRQ is requested, after FW has reserved the
vector.  Since commit 0d6a7c417983 ("irqchip/gic-v3-its: Enable
dynamic MSI-X allocation"), arm64 GICv3 systems take the dynamic path
as well, but write the message only once, at allocation.  On an
NVIDIA Grace system with a BCM57508, raising the channel count from
18 to 32 left MSI-X entries 18-31 all zero, and the 14 rings using
them lost their interrupts.

Keep the allocation in bnxt_check_rings() as a check that enough
vectors are available, but free the new vectors again right away when
FW manages IRQ reservations (BNXT_NEW_RM).  bnxt_reserve_rings() then
allocates them on the following open, after __bnxt_reserve_rings() has
reserved them.  Without BNXT_NEW_RM there is no IRQ reservation and
bnxt_reserve_rings() does not grow the vectors, so keep the current
behaviour there.

Fixes: 2d51eb0bd81c ("bnxt_en: Add MSIX check in bnxt_check_rings()")
Reported-by: Andrew Preece <apreece@meta.com>
Closes: https://lore.kernel.org/all/20261022193620.2152038-1-vlad.wing@gmail.com/
Signed-off-by: Vlad Poenaru <vlad.wing@gmail.com>
---
Tested on an NVIDIA Grace system (GICv3 ITS, ACPI) with a BCM57508,
FW 230.0.165.3: the boot-time channel change (18 -> 32) followed by a
ring resize no longer loses completions.  With instrumentation, MSI-X
entries 18-31 read back as all zero after bnxt_check_rings() allocated
them, and read back correctly once bnxt_reserve_rings() allocated them
after the FW reservation.

This conflicts trivially with "bnxt_en: Clear bp->total_irqs when
disabling IRQs" from the "bnxt_en: Ring accounting fixes" series on
net-next, which adds a bp->irq_tbl check to the same condition.

 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 0682060b048ce..2d14d991a3ead 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -15093,6 +15093,7 @@ int bnxt_check_rings(struct bnxt *bp, int tx, int rx, bool sh, int tcs,
 			hwr.cp = min_t(int, hwr.cp, bnxt_get_max_func_irqs(bp));
 		}
 		if (hwr.cp > bp->total_irqs) {
+			int old_total = bp->total_irqs;
 			int total_msix = bnxt_change_msix(bp, hwr.cp);
 
 			if (total_msix < hwr.cp) {
@@ -15100,6 +15101,17 @@ int bnxt_check_rings(struct bnxt *bp, int tx, int rx, bool sh, int tcs,
 					    hwr.cp, total_msix);
 				rc = -ENOSPC;
 			}
+			/* FW has not reserved the new vectors yet, and writes to
+			 * MSI-X table entries beyond the reserved IRQs don't
+			 * stick (seen on BCM57508).  Free them again;
+			 * bnxt_reserve_rings() allocates them after
+			 * __bnxt_reserve_rings().  Without the new resource
+			 * manager there is no IRQ reservation and
+			 * bnxt_reserve_rings() does not grow the vectors, so
+			 * keep them.
+			 */
+			if (BNXT_NEW_RM(bp))
+				bnxt_change_msix(bp, old_total);
 		}
 	}
 	return rc;
