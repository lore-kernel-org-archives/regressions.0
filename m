Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF95C2F5
	for <regressions@lists.linux.dev>; Tue, 18 Jul 2023 11:12:45 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-992b66e5affso770523366b.3
        for <regressions@lists.linux.dev>; Tue, 18 Jul 2023 04:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689678763; x=1692270763;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EuBvS5kRKpThC2bSoBoqzJHzt9QvszOv1UPOwkEOThU=;
        b=bCxL9+oSfqilKG29JbYyiLXWrMcF47XlgJXkySu276iOuesx7iBjkkhMbCBSyjzy65
         7kaoDmsAwY9CE6OLVkZimYEtqpi3LCKUETY+T74V1fZ1RYll9dHrez/pA2YyySY2PDp6
         pyw8rzo3QYUgeBL5CpGjmj07Jl5swMlQIxfvtWq8gA6ihtJoZweI9D9SkhUVyTTg9Ykp
         X/s9OLnlPuqNqPDBMJn1vymgs/wD/VyB7dap+C3d8myWfrVic5qTd3pU+2ozTxu6J8AJ
         WpsWmdC2FkycAHEjFnVyfcr439fGVb68d1FLPq5qEh/pm8ImYfTTxSAJkCN4WScABk36
         TXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689678763; x=1692270763;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EuBvS5kRKpThC2bSoBoqzJHzt9QvszOv1UPOwkEOThU=;
        b=UAyFO2y+0S9qw57mJIrTXj/HcTTbwPRFIif7plMzFEHagYsuCFa3zvarK7Ve5zXshO
         WnARUy3DU/LTc293+lAgiioJjykE4Mp8sKy7TYuag2/UD52s3t9kCrA9vf9Gnw3yIK3Y
         j07eC7RXYwWszh8BpBiZEEBhBJ4Z6vIABdRZ006bcDZ8jAN2w1PlwGtpA/jNNBjTyWpq
         Jak7RcEO0DlDFOQt9LdSH8EmLR6VjtPvN21yRUMOIKcIAIJnLAje8pZc05DQJ0ZFC+KO
         Sm2wv90aB6zrwZoTWIHiehkKXmgQdkqwFqynAY0GoWLpqj/cBHzO9EXsJMyjLpdezAyB
         9d0A==
X-Gm-Message-State: ABy/qLZh0KjxQFNUh7vcJpaSfyc4zwAISfCNXGQGm+cU6OmgPRnt8dJQ
	Q+1X7bvMkcifPJ2RxTqk1rw=
X-Google-Smtp-Source: APBJJlHb4hnTz978Nx6RoiZt7J4fi2L4j0VgMuqisrYa7sn4rUx8B2mvBbWIydFmKylkP/SDYKRgSw==
X-Received: by 2002:a17:906:1d8:b0:993:d7c4:1a78 with SMTP id 24-20020a17090601d800b00993d7c41a78mr12027603ejj.10.1689678763477;
        Tue, 18 Jul 2023 04:12:43 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7315:d100:15fd:b3ca:86:923? (dynamic-2a01-0c22-7315-d100-15fd-b3ca-0086-0923.c22.pool.telefonica.de. [2a01:c22:7315:d100:15fd:b3ca:86:923])
        by smtp.googlemail.com with ESMTPSA id b18-20020a170906195200b00992ddf46e65sm893120eje.46.2023.07.18.04.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 04:12:42 -0700 (PDT)
Message-ID: <055c6bc2-74fa-8c67-9897-3f658abb5ae7@gmail.com>
Date: Tue, 18 Jul 2023 13:12:32 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH net 2/2] Revert "r8169: disable ASPM during NAPI poll"
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 Realtek linux nic maintainers <nic_swsd@realtek.com>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <ddadceae-19c9-81b8-47b5-a4ff85e2563a@gmail.com>
In-Reply-To: <ddadceae-19c9-81b8-47b5-a4ff85e2563a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This reverts commit e1ed3e4d91112027b90c7ee61479141b3f948e6a.

Turned out the change causes a performance regression.

Link: https://lore.kernel.org/netdev/20230713124914.GA12924@green245/T/
Cc: stable@vger.kernel.org
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/ethernet/realtek/r8169_main.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
index 8a8b7d8a5..5eb50b265 100644
--- a/drivers/net/ethernet/realtek/r8169_main.c
+++ b/drivers/net/ethernet/realtek/r8169_main.c
@@ -4523,10 +4523,6 @@ static irqreturn_t rtl8169_interrupt(int irq, void *dev_instance)
 	}
 
 	if (napi_schedule_prep(&tp->napi)) {
-		rtl_unlock_config_regs(tp);
-		rtl_hw_aspm_clkreq_enable(tp, false);
-		rtl_lock_config_regs(tp);
-
 		rtl_irq_disable(tp);
 		__napi_schedule(&tp->napi);
 	}
@@ -4586,14 +4582,9 @@ static int rtl8169_poll(struct napi_struct *napi, int budget)
 
 	work_done = rtl_rx(dev, tp, budget);
 
-	if (work_done < budget && napi_complete_done(napi, work_done)) {
+	if (work_done < budget && napi_complete_done(napi, work_done))
 		rtl_irq_enable(tp);
 
-		rtl_unlock_config_regs(tp);
-		rtl_hw_aspm_clkreq_enable(tp, true);
-		rtl_lock_config_regs(tp);
-	}
-
 	return work_done;
 }
 
-- 
2.41.0


