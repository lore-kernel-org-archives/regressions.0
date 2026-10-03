Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3778B48EC8A
	for <regressions@lists.linux.dev>; Sat,  3 Oct 2026 19:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791054852; cv=none; b=NXhuP1fo3GmsRmgKezkD3gfx4/DnJV9++MJ7x20cutO9+MjIJhkRqTHoVdEFnMJYq6BReZcFfW1g5DP3fjBEplRyGlb/RFwXKByQIH3KXmC1awSCw8ATw7I0biYTTlW/MroGhfbk74nxIEaWX5mOAv4/m2b4h8NsTyIaUz3WkPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791054852; c=relaxed/simple;
	bh=o2SsJ/QcIsSEwjwMTmQkK/81ZAEDrnlVJnW+TJO5BtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tm0FnA0dmF08zR/N8uL18ZfWQ1hrTUjTOsUkXa9MUlqXvPmMVxp9TbBpIc4HQSIXBgt6uuWctmj8Ocn0XmTJCwJtjq8vEFH/CIEzIcXWisDfEmSyFccw834rCyL8N0Rwbva1vXtcckN+r8ak6U13HRHtOi6syns2BvEP6HyqZXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gV9hnh93; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gV9hnh93"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so4901375e9.1
        for <regressions@lists.linux.dev>; Sat, 03 Oct 2026 12:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791054849; x=1791659649; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o2SsJ/QcIsSEwjwMTmQkK/81ZAEDrnlVJnW+TJO5BtY=;
        b=gV9hnh93iedOWi64uikaNNhr/kRrIDhibyT1sFjvVi0YjPJ4sefOMn6S9BGEdaoiV6
         JsziczBR+eR4zW7AIamLm9pkVyIb1MmQyxppdI11oLZKFw5uQXw6J1Wz+n8IoI8JQVVs
         3lacqpAEkIw248/BiU20D/zeZty4W5aNDd7vX1hnOUeBuU+HQTg6mThD+rTKZCu1roJ7
         xYTJGbx1kr6+rxNUubccf9+ILDjCqP/uvFwazQ+Fxz0MQt3bktmjDhnRMl/ifQ9p4Ag2
         YD9hES9brw1espO5DtVTNfiXnn0DKAugKNFGrlYom3oe/SRzmmSUJ5IL2dXljs7og8RW
         zwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791054849; x=1791659649;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o2SsJ/QcIsSEwjwMTmQkK/81ZAEDrnlVJnW+TJO5BtY=;
        b=yihPYDlPBeawYpV4wbOF+2uCvXnlt9WIupog/bJGdxFYDJjaceIiunJM5N6pjsUiwc
         hDo2zsD+vyMi/NCi4JWxNjLTK0E/Nga3hbncvNk18UXGeJ8ub2U6tAnMwyHGKcB19kId
         8V9J6LMMLbf3qT1djRIOv700mdTG66KsX1+2CEar2d0oX3NJ8gGwtASPi3a9pzG2wLrM
         ymOqk0SfftMfgPjUhcTU3vM8vMeugFDWrlpxFDAlwvBqC315VG+zu+3bbx1YP4hts9VG
         cRcWIuAZxM0fcxjgn2pHCeYTI//HPDpWxSEjQMfSClVbTSXxUVzj6no+o/aOtBaorLOJ
         w8aw==
X-Forwarded-Encrypted: i=1; AKwUvBzYIG9FqoLZQEbZgGIfVD1sWPPQK+7MKZ3mBHZ8wB02HaWKFzWqfBBY+F+Zy+rxUth2A/+4kqTdz+dtbw==@lists.linux.dev
X-Gm-Message-State: AFuF++lu0j/iOF/B/CCRtBzSKJMly6HS9ZJEt0GI73wWrlAnAwo4nDas
	AgSAIw0xIWxzSJ6ouAxBWni/0zaefNwn9xCt//Bqugr4cLgSf3F+9s/B
X-Gm-Gg: AYBFou30RjjYaIrJLWEyng/5gaQX3bQpxttKn2gy099jotivMkWdcbxJ8NcBEADbQC6
	4RHCVOz+DwB7WjjwYcfWqPsjlod5WAgxopbjyal/3TLBd7f24w070laxSoNZaHYhfHRofIAdGK5
	CE6s7djFjaSKoqUdSntruj8rHyjJqKgJ+Qcq2mb3mXv/To4zinLJ8TIFTcLoFWJGbZCFLfvz1zy
	RVZfS+/DfgKDIh0kUztVfknlGieuMjGOw1Zy+53/XEbbRinA9tW4TnA9rpKtvHnASueBhjO0aHj
	mXrvIrLJy0f+9dBQE377GkEGwitifIqsnODHDL0e5eqA83GZxWQlHk5b1j1535zmCzgD5aFQ8j3
	gLeRuyg3FZM7NxJkJEsKVxG0l9WOiD0fgKbvV+Z69oC/wPAsYQhN4buKDZZYKRn5uFtVuTIqWHT
	nKvG+wCqKUxe6HD8uKsmYLWWJnr1w1RV5qjr/vc03EJBZD/qJIdAWLCbn/XHqdp/BSBZHUn1OCB
	EAx+Mf8bf+mS55S
X-Received: by 2002:a05:600c:6995:b0:4a0:1e53:e51f with SMTP id 5b1f17b1804b1-4a02758572amr109139105e9.14.1791054849210;
        Sat, 03 Oct 2026 12:14:09 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.11])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a0280dc6e7sm258672005e9.15.2026.10.03.12.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 12:14:08 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
	regressions@lists.linux.dev,
	Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
Date: Sat,  3 Oct 2026 21:13:59 +0200
Message-ID: <179105480736.32023.13572677576800176858@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9355acaf-60a1-4fc0-a27e-8195eda3aac4@oss.qualcomm.com>
References: <9355acaf-60a1-4fc0-a27e-8195eda3aac4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, Oct 03, 2026, Akhil P Oommen wrote:
> Could you please try this fix?

I tried it on the Lenovo Yoga Slim 7x Gen 11 (next-20261001, built-in
firmware): no change, the first GPU init still times out on
HFI_H2F_MSG_GX_BW_PERF_VOTE.

What I noticed: the first init at probe always fails, and every retry
fails as well until gpucc's sync_state is forced by the fw_devlink
timeout about 12 s into boot. The GMU node never binds a driver, so
gpucc gets no earlier sync_state, and until then genpd keeps
gpu_cc_cx_gdsc on. With GENPD_FLAG_NO_STAY_ON on gpu_cc_cx_gdsc the
retry when the compositor starts succeeds.

Oleg
