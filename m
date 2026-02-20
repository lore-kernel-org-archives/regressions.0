Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3FE2DB78E
	for <regressions@lists.linux.dev>; Fri, 20 Feb 2026 03:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771558524; cv=none; b=nWlTTi5WpWL8tpz5Yb4u0VOLPIYzdn4nZCZKQ9eL7EmsAB6dUPwuqcxc7EF8hqJRvvJDfWXZOr0YyP9nMFqWeJrpxyNk4UFd/Y1ZaHFAdg2IuHCrOJCDCyYTNe5lsAPkFOuAwSG+T+nvMevm1ZiqvFsMjcEeaC0ux0teKo1QuZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771558524; c=relaxed/simple;
	bh=XTzIwXxlc/XZg7IRfxDzv+9PJZyn4samfnMkHRPr2eM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=SdJxwBYd1Irw5lSAAYILf+lzIQzugR/mGKUHsjTMfOOFrbdl3JzPiWG2AZrqVobOTGTz+ShXX0SOEk/j0jrm3NWQklbJD1dzn4UdeMC8SAoDxgI6Hrk6XArfLXeQRj69FeeZ32JMTbFkX70CWES5LqzOeo9Qx5cRJe6TOoNpBu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIbVx6Xx; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIbVx6Xx"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3871017fea2so23189461fa.0
        for <regressions@lists.linux.dev>; Thu, 19 Feb 2026 19:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771558521; x=1772163321; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qs3XtAW37afRA0+1P/Gos74N1AN9EdwS5RQcuwJVsX8=;
        b=CIbVx6XxJN7celTxJ/ckY+X5He7PqeO71kaWemxBMDD2w94Mh3JExpbSpIm6QWY0/w
         wd/obYGSIj/FILEtgcZKuvnFmgvUbpyPZATW+RXre9AS0lZTwsEC2WL+Jv9MsRNxVE/t
         ceHkeAGfrQlbgC9KBWAHsmOACqpMDPHLA9HoYlHMMBfbERWEV56WDQa92dkScem2pXsY
         MKomCle54y99xzeHUd6dfBvMZtnqmS2GDiPz6MOpZ+U5qYNwdpZNUgSwK+smZJnsX6O+
         fhR3LatsUw7qgHj0mjQtpYi2PEqjicYaMH31sdwvfRNxbOVVsG3/SHfZT7qN28NhXTNB
         tStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771558521; x=1772163321;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qs3XtAW37afRA0+1P/Gos74N1AN9EdwS5RQcuwJVsX8=;
        b=w1WxXsixtJ2Du9V3mBbW00pca6UqCt3ZvrI+E4xUPF9dComSilHxwAli/riH7m3Vm7
         gzPwW/sS3hSK2tnWMyqyVQ7MnqhT83kgYSQExg7XjuNHoM3J70HUFhVLO9o85sbEgYmG
         oOt3pVH3rZcSt4mC0Soq0qLoYJvKN0oGAAJZpeHeNUf9QAK9ZQ9drVi8c+bD9LhadJcx
         GvCSe2ZmDBnbs7P0VvivYonkeoFdremhTDbndsU2CgbhyPv3rJkxKqwoF7rIjVk/b84D
         eAuEjoK2YwNaGwe+B4pju5nt3ysXUaBFYLeLNTQgnZTImBv3ouUjUYVPLbrvCXGYsJuK
         ++3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW68Op4Uwa0fxBLmtDRPlSJ77Y733M9fNtAyZVaboMOgnAVXqYHUGn4tYujPLHyUZ3VqWFWdP06U7BR5A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yya+PQ0+cOcqiKbvkSionRH+JwPEg1385XTLVaPDd+GoUKz4cU6
	gTbdloGkuOJobXlhBfldMiy6FNj9X+/vl0rCaVSA6ttQMKHxEs/MfyhF7gbjdTnYow==
X-Gm-Gg: AZuq6aKCE4oryb2lrLvDNebd4/cbbTSuKZErlawAkFicK7sw0Q0YSbtc4HH9Y7HH5RM
	dNKXIpBmzethVXAoAAkTVBCPVJ+IeJL16kyyfy0ZzVkGQYzL0y+Cu9XPZpMBLN7dSjFv7iXtf6m
	pWqijnnUwzY+db2U2Dgu+qAc3bvvePYY4ox9RL8nweS1M9qHfrAUsf72frdxg5Ay0y2DoguPkFX
	y8zo7sHJzwqR89AxxxcvcB3ZTNDb6dnHEqlJaPJcIRB0Pw8k/6BUzx6ApRZCWCf8jrB8p+bLJz1
	KYeB7R8PPq7p5ulgqQcQCis+ldH7V3f9SD0KCWCjMKEbC3hzPnAGOrI5JGE1lMnI//ivl5eo9hY
	lFpvJuhIOWm3dcMncHn0iRxNcnTVsrEwcyBiCudWQCjCAsIZeMgpduL8JfX65AOlM8WpKM3iAXt
	7K9c5cgsg=
X-Received: by 2002:a05:6512:acf:b0:59e:62ea:239c with SMTP id 2adb3069b0e04-5a011eb09e2mr110065e87.8.1771558521108;
        Thu, 19 Feb 2026 19:35:21 -0800 (PST)
Received: from localhost ([2a0e:e6c0:20d0:4f00::1d])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5ad733sm5745912e87.69.2026.02.19.19.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 19:35:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 06:35:19 +0300
Message-Id: <DGJH30US2XMK.S2HOHR14LIW0@gmail.com>
Cc: <dri-devel@lists.freedesktop.org>, <regressions@lists.linux.dev>,
 <mwen@igalia.com>, <mario.limonciello@amd.com>, <alex.hung@amd.com>,
 <daniel.wheeler@amd.com>, <rodrigo.siqueira@amd.com>,
 <alexander.deucher@amd.com>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, <christian.koenig@amd.com>, <huangalex409@gmail.com>
Subject: Re: [REGRESSION] VRR not detected on a DisplayPort monitor using an
 AMD GPU
From: "Ivan Sergeev" <ivan8215145640@gmail.com>
To: "Mario Limonciello" <superm1@kernel.org>, "Ivan Sergeev"
 <ivan8215145640@gmail.com>, <amd-gfx@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <CAKx_Wg7_HBxuq5W4T_AmoFYJGQpa6TAS_Fx9SUzyy1itPmj5Bw@mail.gmail.com> <090d89a2-4f80-44ef-827c-6462d8948493@kernel.org> <DGJFVPAQJA15.378GMU7XZXLU@gmail.com> <DGJGDIRQWDG7.XHHKF6UQP0HG@gmail.com> <c70fe261-7fb0-4af5-b755-f02b193c8c5f@kernel.org>
In-Reply-To: <c70fe261-7fb0-4af5-b755-f02b193c8c5f@kernel.org>

On Fri Feb 20, 2026 at 6:14 AM MSK, Mario Limonciello wrote:
>
> Can you check out at your bad commit and apply just 7f2b5237e313 at the=
=20
> bad commit?  Confirm that fixes it.

Applied 7f2b5237e313 on top of 0159f88a99c9 and the issue persists.
