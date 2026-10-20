Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486651;
	b=jRzB6uyJeV9g9UnwGhDoePlHZ6ToAzw8QDkLT099ygepJuIeFViWVTWtDhT6TXnuDPPz
	 Csr9qJSW7EJCVXV44I8JoB21cDW1PA341ZrjClT0Xbo1xazRck+ELpfUgfqcrayC8XY+a
	 DocqwtO85rq6rcA2KrOiDC1knJE/pEPqhpBPBlOYXyBmCWOuhkYaVPV62kYN+h2woCXhj
	 7R6unwX/GIYbSnCZpDlYUfAqhVWlJeubrg93mwMZcWrNgtxGfzb4a632tbPxjnAEl21//
	 mv9oLwKakAvcBM+EVvvmy1Zg+WXvlxjrqlAAqYk3C23KwiqfccgEyesmTj9eM+oNjkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=yRgxxPfGJY8DFWCh/QAVbioiWlq3zShp/hCewrsxoHY=;
	b=uANp47kYP70n4oRF/yponRRNjcttBi/+n5Va3hLz4VjltGNBA6pzyrQGPa3fi/Wv5Yjo
	 ShQ3yp2ef/536ogB2Q+vVVpimY53Bv58Ny9BURPQWkFJ6ihrU0fGqDlge4MuxmX/CGYy4
	 Vevp8IQyPHyaudlMc56bLCQbrrUmqkKGrbD5ZBH2unVe0glD0E/PgkdTZ63Bfy9SomkN/
	 befFfIyqmowljuuT3qgV9/JpwMu85HwtgrVrA2mrNiV9tD4O9eXencvll35bRB/JfoGEm
	 kE+I67fJgYK0T6nU6PXIfgPRiGkcLC2rgTKGrvSM+SpVYZt5HXXsppB/GnLt8Tzsv5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F8drcMeS;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40276606A319
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 08:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40276606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F8drcMeS
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so14387195e9.1
        for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 01:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792486648; x=1793091448; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yRgxxPfGJY8DFWCh/QAVbioiWlq3zShp/hCewrsxoHY=;
        b=F8drcMeShkXGj0wtkvi9C8DTG4SjpATYPHrXBIo2InDpeW4iernB5kweLJl3dQREj/
         ohwtJd0a45UnqHYq8wPozE8OUh4t2OFydeaNkl8YhU9YF6s2GoKm3R6baABosQ2EcxzV
         xm/Z4vBdnOdqjW26AzcjlUp0NmqvFSoD6H7uenyHQhNxYvjkrUfHFwwQQnLYDgQx3L95
         qYHPcZwTGNFIgG4zC7c3DuL+BFavh3YJSdAg7xjsvRe1fAeZ2PopRhICcQ5caxOxUQld
         uip1Zm2gpFhgC7jfiCzp5GtPXATPurdgJ55FTywHo7g27HwjqNP2bQU37t4xRUwvI8tb
         Qawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792486648; x=1793091448;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yRgxxPfGJY8DFWCh/QAVbioiWlq3zShp/hCewrsxoHY=;
        b=i8QGNzPTzC+0Hu54E00Co2G0/wpNV+eve+u4bHQt6/pMZmXX0QpoYpR0AdUTlRSpWR
         QdVIAgw206GOqzmj1ugIXVv7IM4ZrCvY1zn0RflT3Q9nm7N22h4k+g4gvhcFOcPAE5om
         aQV0Y0bm2p3p4K2etc845QrjMr1BsyDGCX/I4tGO25u1ZEKJetGBw0SHx6ACkrmg/498
         Uk4I6qx8J9OmjPY8ZkOwnRLqhkO3F9p0o3U91WceUZM7ngyar4IFWGTQH6aASGxCkMdc
         MpNPA3ll3GYgQbRZ9qQtJ8RNm50xeu5oLpNGqRkwt62L+qtCYA9FD3sBh9vzx76Sr5pf
         03qQ==
X-Forwarded-Encrypted: i=1; AKwUvByk7zIVwCWszhz/+I3Sh2drxia/sOc6Cn+if/X/vm9x8OP+QX4+CT7b/+vBUNOGGwgUUFXemf5OSQArBQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIir1xX0OzkdiS9JeFoDUNsc7TRUCjo+n5z++XjZCptEsDe1WPS
	Tf/DQnpe+AifKz5X9kDP1bj5skHX1AV6ppIDu4bMkTAXix9vBt34D41o
X-Gm-Gg: AYBFou1++mWeBNMdZRiaDgLhgJXS3p7C/bmrau2ZtpySWr2k7oxN7UB1h8Zgs7+/AlA
	6IUFVNvhE0I/lAf+77U59RLmgBxoBm3mg25l1gS4ozNZMYNykcd3bjvz+Jf/xrSuD0nBbFrz5FN
	p+xi5aIvnVnvOqYBkCKjqRGt7tqy/0y7A7x4RY1vRrhH7hB9APANoOjm7PSdf2pLZ6ugLqAk21F
	cd32k+Haz83QC1xbphxAwFBPMcpGBqw80RX8l4xO7eFWiXzpq/fp6f5vwUmail25UemUC8ZZa8f
	1OnrjbjTU/ETbnVGrnofCSbxl456URu6TqDdQtRLVJ99IDYz8SCV5mdFcVDOjn18KLgvLyO4H6u
	N56FGRdapL8WvFoyoWvxx6d7qClneG9Y61h8gLeEQvy5v+GoLSfSGQj/09U0c28A5gr8RXpWPvh
	vkGpdFDaMd4KHUdxwFjOBXK8Zuqf6CM2RszG1QX2n8v6GrMpzoiIpBPYZBZ73PVV7SworLyVpJv
	GgXo1jL
X-Received: by 2002:a05:600c:8883:b0:4a1:80d8:aed0 with SMTP id 5b1f17b1804b1-4a1d75fe793mr166287925e9.15.1792486648186;
        Tue, 20 Oct 2026 01:57:28 -0700 (PDT)
Received: from localhost.localdomain ([94.252.74.55])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1f2e8daffsm57580335e9.4.2026.10.20.01.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 01:57:27 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
Date: Tue, 20 Oct 2026 10:57:18 +0200
Message-ID: <179248663855.32151.9955864156939592299@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CACSVV00x091i7BKW+bj0RUnkd4rOrHXbhZ4zF6SuTU1NAqsFTA@mail.gmail.com>
References: <CACSVV00x091i7BKW+bj0RUnkd4rOrHXbhZ4zF6SuTU1NAqsFTA@mail.gmail.com>
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

I guess this should be investigated further. Yoga Slim 7x Gen 11, no modules,
firmware built in, so the GMU comes up at 0.6 s.

It's rpmhpd. Before its sync_state, rpmhpd_aggregate_corner() pushes every
vote to the highest corner. The gxclkctl probe does a runtime resume/suspend
of its GFX and GMXC domains at 0.18 s (qcom_cc_probe -> pm_runtime -> genpd
-> rpmhpd_power_on), and from that point both rails are stuck at max until
rpmhpd syncs, which is at 2.8 s here. The GMU then does its CLX DCVS
calibration on a rail that won't move.

The GMU log buffer (fw v5.2.38) agrees: the calibration trace of the bad
boot matches the first good one step for step up to the ninth level. There
it stops, and the firmware puts HFI_F2H_MSG_ERROR 0x007306c7
"ResMgrCalibrateDcvsLvl" on the debug queue. The GX_BW_PERF_VOTE timeout is
simply the next message we send.

With gfx and gmxc taken out of the clamp (hack below) the first GPU init at
0.6 s just works, CLX tables included. Three boots so far.

The wedged GMU after a failed attempt is a different story. Retries after
rpmhpd's sync_state still die with "GMU firmware initialization timed out"
until gpucc's sync_state (fw_devlink timeout, 13 s) collapses CX. That's
what the gpu_cc_cx_gdsc/NO_STAY_ON thing in my earlier mail was about: the
recovery, not the cause.

The RSC side is not it. On A8xx the GMU firmware loads the RSC sequencer
code and TCS slots on its own; preloading them before the first boot made
no difference.

Abel's CRD failing even with msm loaded at 90 s doesn't match this, unless
something keeps gfx.lvl high on the CRD after sync_state. Could be a second
problem.

--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -1009,7 +1009,7 @@ static int rpmhpd_aggregate_corner(struct rpmhpd *pd, unsigned int corner)
-	if (pd->state_synced) {
+	if (pd->state_synced || pd == &gfx || pd == &gmxc) {
 		to_active_sleep(pd, corner, &this_active_corner, &this_sleep_corner);
 	} else {
 		/* Clamp to highest corner if sync_state hasn't happened */

Oleg
