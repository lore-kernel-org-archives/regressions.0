Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792987030;
	b=AiqSSHR7aoKTsOSMvny0SOx+c4uQa4AxrtCubrShPTofUb8beCjL97LFALE1E7ePkJSi
	 O0Se7NEHqD9zWxf/ZulQn6O4E3bJwylxrUh/d4VuDLJv1bW0vVwaCHFs7kufVxhrbfEaw
	 mda2V79558GgF4TRhJsL8VBU8gqIt9UhHIdqkzUMteVIEbIPEgicIBJ2iqNeSQtbOrLRo
	 hSdeSx04JtKcg8yCBLzdltdsuN+mt7w3X8ulIn4iafcYbMYeALj20E4VS7ek9rFXLljTb
	 7NutiUSg82ILG9enC5SldFx4Dso43PaSPN/+viDI1rmkJOko96/8K8e3BrCK6fDlsQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792987030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+ScCUUWyJM//qpTpz7tt0Fdxp9XvYrNhMa0jbjZM+Ng=;
	b=BSKGwfcc7gr4waPURt1nTTf3Bo0n55LaOkXcERtI/8gEZ5ZQUl5HcDT24h5pUJ00j/Em
	 iaTa7fW9H5krNR1pvkMrnmuOPdETWmRmleH9F8OH71gDR+ZcSPdbB/OwQnLY4N4DkXeGB
	 Uw8PQ5MMHf/fRO5xD7/ixptxDa+X+FMHD0GlgvCZFicF1JqryARa+BI2SF+DJDTrHEu/l
	 ZNw/J6q+N7XKk2eu2Ag+SDvBsoiK8WUROslacdNkd5IilbF+7Fxl2u6w773ubotl/bxzB
	 ahYrVvmumbt4HbLJI9Mo73dgFhi2bxF2SvW1Ebt6T8r6Ki6bgWB5Uyx3qydhtzHS4bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T36z1pMz;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F6E606A31D
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 03:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F6E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T36z1pMz
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35b2c599f43so467826eec.0
        for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 20:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792987029; x=1793591829; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ScCUUWyJM//qpTpz7tt0Fdxp9XvYrNhMa0jbjZM+Ng=;
        b=T36z1pMzm+2Wl3XZHdJ6qucTgaWN+zKqKndJptZz/CCaasAE3gMrWcKooKVy3SuamQ
         raaH77cJ+SIEKy1Dr1Z3lpVcGAGRYvJCcAULEvnJ5E9sSFZrVONxPwLWZGLV58dmnVU9
         EROcSH1dPkaVoW81nuSCMJGw/ZcnG6oSHtZR+ZuK1+VQvPn0Rt0oI0MbJKhbrkcbcIWE
         1IYSdpRRyObBqxhS7Cixq8FFzMhITxn4cWltqqj9Vbk1BeUjVp+nOoVNWwkSF7TASUpD
         0MIlGzBw/hmRVqb9x5YwELk2POU3wBt2UMtCFOfPpmFvh51Q5LI6XezL1y4hVjmeGZk2
         /LtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792987029; x=1793591829;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ScCUUWyJM//qpTpz7tt0Fdxp9XvYrNhMa0jbjZM+Ng=;
        b=YUOW74IHJd/jM3/UHMP/782uIjLCbMwQmMLFDCfvaRiQYnlYLReMWRQX4bdfybELHU
         RIFDCSfVoiQqfu16qp9cpPMLI6bTKGWmaDmSIXRQCiJSNdgFDTG26pZEI5e042/PmqGH
         SiuVJ4tcrIXm3IYuFSNewxKk0SrMK1j2z1Xzxvsb7qAVE7JVZ8AgaGHYyRrNtsSNq3O7
         JwRgEiyGzOqxvRiFqd9ZveDBgxdrNWeI9UIK/uerFpHtZ393TDmkJLW1WjrpEC2Rx192
         S7JYMdsU1fbkv5DFFDoo/LLoOHWdfgUxZTFcCnYcuc5yUS0UKepqBmc55QrEpRX+Gl8n
         bojw==
X-Forwarded-Encrypted: i=1; AKwUvBwXIZyriz3EY4s4f3pFOhgYyLSB0ZttUdYNgCzbSR+Oq2rE2VGhhwJR2oFT/3yQbSnkhIsKngxRkmDQ2A==@lists.linux.dev
X-Gm-Message-State: AFq9FYJe26HNR4enBZKDG3Lecef0yJIGdKqiL3cCN+7IT3wOnjZvy85p
	W7YqoTxs26CXNE/XGjQOc/NtIvRKxy0FdSUxoCasfA1Zm1nwFOtlMQPI
X-Gm-Gg: AYBFou3FDMnhV09plDKdUer4mCYohY9jjbJYaexkSfMBe+W4eN40x/8jgo6tSjsWOSF
	JcILVR1QMHxvDsal5Ts3lxD7IRJq4EYa0lI82MIMubU1pmhWzRba11B1KrFX0vDe0yh27TnQ0XV
	PgMU06+Y768a0C+dTk8wDV+vSKWPTnKq0Wola4crlpSSX4Y8ZYtCkc2kS1gNkex0T7cIoOOULHU
	q6T4SwiT6xZBRvpZKoQFVnc0G2BbJxsJLPUDDfYRaSBKjqxeIjZ+yU7/ByxP4euAjfOohRuiX0H
	4xGoqv0wyZOmSgSDm9VbwGIjrqnNcsWl7IttHTLy1rn/VtZ3EyUMWdW1PK9KPNazXbkqU3LRWw1
	9dCNaELenlmwPJB/+R8b8pJ2diKOgeLeQaNHy1RHxNmxNc8rJ4skkk2FZqZPPZxTgXrpTPyaT8N
	gRZH/M9si0iszUbS/ltgjL1vGUg9PX9sSgMK2MJItECqGyp3W/d3jv3Avh4icUxuAKCbcbMxX+0
	9DfGf3/v3xi+gp6rsuagYJbcDf5fC3wZq9obatCPdTVebMW5Bl57JR8XGOZt+wz2BSjJA6JuD2q
	Pj+E0U92lbdVyKEE4fvlVDACQsBpK+/6T+EKtmaaF1jhObOB5YSNzOECtADXTSLgr1s0sSKy
X-Received: by 2002:a05:7300:f0ce:b0:366:846a:e21d with SMTP id 5a478bee46e88-369e84d35c0mr9182619eec.33.1792987028486;
        Sun, 25 Oct 2026 20:57:08 -0700 (PDT)
Received: from MacBookPro.lan (113x35x113x191.ap113.ftth.ucom.ne.jp. [113.35.113.191])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d93663sm24441240eec.13.2026.10.25.20.57.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 20:57:08 -0700 (PDT)
From: =?UTF-8?q?Paul-Louis=20Charri=C3=A8re?= <plcharriere@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>
Cc: Phil Sutter <phil@nwl.cc>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	Jalen <jalen.lin@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>,
	regressions@lists.linux.dev,
	=?UTF-8?q?Paul-Louis=20Charri=C3=A8re?= <plcharriere@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH nf] netfilter: flowtable: remove hardware flows before unbinding
Date: Mon, 26 Oct 2026 12:56:51 +0900
Message-ID: <20261026035651.40052-1-plcharriere@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <CAHqkChbVoGHrWtaFyGFaLQDiAunWw1qOpW-vKSgkKxWEfQ_tCg@mail.gmail.com>
References: <CAHqkChbVoGHrWtaFyGFaLQDiAunWw1qOpW-vKSgkKxWEfQ_tCg@mail.gmail.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit 13210fc63f35 ("netfilter: nf_tables: imbalance in flowtable
binding"), FLOW_BLOCK_UNBIND is called when the flowtable hooks are
unregistered, in the commit phase, and nf_flow_table_free() only tears
the flows down later.  Their FLOW_CLS_DESTROY requests then find no
block callback, so the rules stay in hardware: the flows keep being
forwarded, and drivers such as mtk_eth_soc and mlx5 keep their entries
and reject a later flow with the same cookie with -EEXIST.
Commit 5acab91458ce ("netfilter: nf_tables: unbind callbacks from
flowtable destroy path") had placed the unbind after nf_flow_table_free()
for this reason.

Remove the flows of the device from the hardware in
nf_flow_table_offload_setup() before unbinding it, as
nf_flow_table_indr_cleanup() does for indirect blocks.  The GC run that
nf_flow_table_gc_cleanup() waits for may skip flows with pending offload
work, or have started before the teardown, so queue the GC work once
more, wait for it and flush the delete work again.  A direct
nf_flow_table_gc_run() would race with the GC worker.  No BIND or
UNBIND call is added.

Found on a router with mtk_eth_soc flow offloading, where each firewall
reload left the flows of the old flowtable bound in the PPE.  Jalen
reproduced it on mainline with mtk_eth_soc and mlx5 and tested this
change on both, see the report.  Build-tested with W=1 and sparse on
arm64 and x86_64.  In an arm64 guest with lockdep and KASAN, with TCP
flows through an offload flowtable on netdevsim ports, the delete work
of a deleted flowtable now runs before FLOW_BLOCK_UNBIND returns instead
of after it, and nft_offload.sh passes.

Fixes: 13210fc63f35 ("netfilter: nf_tables: imbalance in flowtable binding")
Reported-by: Jalen <jalen.lin@gmail.com>
Closes: https://lore.kernel.org/netfilter-devel/CAHqkChbVoGHrWtaFyGFaLQDiAunWw1qOpW-vKSgkKxWEfQ_tCg@mail.gmail.com/
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Paul-Louis Charrière <plcharriere@gmail.com>
---
 net/netfilter/nf_flow_table_offload.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flow_table_offload.c
index 4365859220e..3844a23af5b 100644
--- a/net/netfilter/nf_flow_table_offload.c
+++ b/net/netfilter/nf_flow_table_offload.c
@@ -1279,6 +1279,19 @@ int nf_flow_table_offload_setup(struct nf_flowtable *flowtable,
 	if (!nf_flowtable_hw_offload(flowtable))
 		return nf_flow_offload_xdp_setup(flowtable, dev, cmd);
 
+	/* Hardware rules are deleted through the block callbacks, so delete
+	 * the rules of this device's flows before unbinding it.  Run the GC
+	 * twice: the first run may skip flows with pending offload work, or
+	 * have started before the teardown.
+	 */
+	if (cmd == FLOW_BLOCK_UNBIND) {
+		nf_flow_table_gc_cleanup(flowtable, dev);
+		mod_delayed_work(system_power_efficient_wq,
+				 &flowtable->gc_work, 0);
+		flush_delayed_work(&flowtable->gc_work);
+		flush_workqueue(nf_flow_offload_del_wq);
+	}
+
 	if (dev->netdev_ops->ndo_setup_tc)
 		err = nf_flow_table_offload_cmd(&bo, flowtable, dev, cmd,
 						&extack);

base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.39.5

