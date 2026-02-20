Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1E34A32
	for <regressions@lists.linux.dev>; Fri, 20 Feb 2026 03:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771556526; cv=none; b=TJRt5plyHrTgPVys44Bk/7WehGvQcCC8+g94enbySA4MZ3Ei/9g5FVUNp/g4vW+/8ijypyPNt4/wSHkipDA0asJQxB/IoBp9M/U117Z6GzAbxFwK96IOWuaogOgyuuUw0uIxU8KUuyQzQW/NpjrbFidieyFUIf5cJQPaywODvpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771556526; c=relaxed/simple;
	bh=hqp1jrv3QaroxdeHoV4ufkhY65ckcSlQNQnG63MUVbI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Z/c8XoeypXTVVoDo39143b3p7xTRt45ExQNehtfAEUB58oDBSuNT2HB7PFgAI6U/Hc4t9fga+3AsHiI1qVlkiNHqCAJqDBOFDwIkBwb/dyLQRp3Kdo/PHjjYAVeXNCRQfDwqt0t3P9rx0/xPgfAyBfvJ9GZv+9RcfUVCwaRV1TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihGpkzMx; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihGpkzMx"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-385c2f88618so14258661fa.2
        for <regressions@lists.linux.dev>; Thu, 19 Feb 2026 19:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771556523; x=1772161323; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqp1jrv3QaroxdeHoV4ufkhY65ckcSlQNQnG63MUVbI=;
        b=ihGpkzMxvbO4bTqnJw5A9ArF43kf+XbgMk7O27c+tgcJ5IQ2cq2bK87SXVwSIR/zp8
         d+5UeSJ8/yTQO2fTQJNrdNePbS6rMKpur2pLdgGCe3eMVzuILl3JhQDx19a5td/Kr2hi
         OO1YjoU2YWDNN4MSVnCeXz/6Tfe5DwPM8w8BvwQYl9mvVusNW29C/yq+QMF5//K/Sw88
         XQ5uOlRVAjGfmeJ+TafEA5rA0MOWZ0Wbz2XlUn3v8Q0LjzGj0998NBedMGRGpPxL7EER
         OADU/XOvoxyuhbw5NwPkxya6umSUZ1LkgQaZC6O/mX6MNpk04it89u/Acmjs5N1/YvyD
         DlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771556523; x=1772161323;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hqp1jrv3QaroxdeHoV4ufkhY65ckcSlQNQnG63MUVbI=;
        b=itZk4cP+R6pEsWGgF+S/NCI3jbEbFsVH/iywoVLvRdGgVCZ3s9APTYynBlWMp00KTz
         WofuGDkQg+W1UhlXHNADaqlBDhyeRvnU3BmRxJcaWxSClzfPD267dv17pMaqu8x8Kg7L
         kyHeTWFlvdS9NFP+fEsQfLW9+Tm8DS3afW4cidttshlZssIwu31amsW+5RWYQhyDCT8M
         RZyWXZ9pqOxMPvurmfR8zFAPN8yScDu4DKzWDbIUC7U05bNbhY1LJF87uXNpNa6oUIv8
         rcPOlJ2s62/Mb6mzJjCqyDhh0vUks03K/HLFl5070l/YI76TADmVISN5/byHyXKDo+Vd
         Vjmw==
X-Forwarded-Encrypted: i=1; AJvYcCWTOaovMwxbb0SVAKNjGZOqA5SLxzqR+CCvB3qLVTLfo36/HmIbom8zQQ+QgPUjUXbMwlC28nSZ2o80+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwSe5QdmCTo+8cGX5trzoogIRwboI6TFKPgGcG2WmyBdzPiyr5a
	rP8gJQYbKYA4xUsf61Ogv/DMPnV7i1Ebr04CfcrtI582YUvPTFKvG3g=
X-Gm-Gg: AZuq6aKx9tFetrc0pDwDmZHivyfRhKqTftcAmSQ8tR6Dc6+9bLo7f7DpPyl5UstDlC5
	njrexE7/S9SNOhySdpP6uCsO2jeyWq83NOK+TzGQU/S5p1CnxtjOQcOj4X4OMR2TfkIoIIQFI77
	WEYwllXQ9ePHMxTRX1rnwLN3IwvprsG89kS6Jx63FQMjDBwnyAbIJ3RoYhFkIbyXLF7432aAHX0
	n2X8UnZvLHEbbk5DqS+FtlsJgwD9/YfZcGwiRVXkajBgLXsmM0/Hd/TjM/ZIla+5CvEjn2zFtRZ
	Vp51v8kNk6N6hsf5V6d4aa/BX/4jrb9fR4f7p7hmkVvSAGoEHLSDdpujf7LBw/PNUzIqS4a/Fp/
	PuzvF4YcmZkM/aEThxPSL1nrN9eAfl0y4fuHL22Oj58sJ6FDayaj2XvaUhgFpWwua1/+u+TUQFW
	8Sj78g6Ho=
X-Received: by 2002:a05:651c:1504:b0:386:e936:71dd with SMTP id 38308e7fff4ca-38846e37a02mr23095861fa.41.1771556522541;
        Thu, 19 Feb 2026 19:02:02 -0800 (PST)
Received: from localhost ([2a0e:e6c0:20d0:4f00::1d])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387069259c1sm52664811fa.41.2026.02.19.19.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 19:02:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 06:02:01 +0300
Message-Id: <DGJGDIRQWDG7.XHHKF6UQP0HG@gmail.com>
Cc: <dri-devel@lists.freedesktop.org>, <regressions@lists.linux.dev>,
 <mwen@igalia.com>, <mario.limonciello@amd.com>, <alex.hung@amd.com>,
 <daniel.wheeler@amd.com>, <rodrigo.siqueira@amd.com>,
 <alexander.deucher@amd.com>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, <christian.koenig@amd.com>, <huangalex409@gmail.com>
Subject: Re: [REGRESSION] VRR not detected on a DisplayPort monitor using an
 AMD GPU
From: "Ivan Sergeev" <ivan8215145640@gmail.com>
To: "Ivan Sergeev" <ivan8215145640@gmail.com>, "Mario Limonciello"
 <superm1@kernel.org>, <amd-gfx@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <CAKx_Wg7_HBxuq5W4T_AmoFYJGQpa6TAS_Fx9SUzyy1itPmj5Bw@mail.gmail.com> <090d89a2-4f80-44ef-827c-6462d8948493@kernel.org> <DGJFVPAQJA15.378GMU7XZXLU@gmail.com>
In-Reply-To: <DGJFVPAQJA15.378GMU7XZXLU@gmail.com>

On Fri Feb 20, 2026 at 5:38 AM MSK, Ivan Sergeev wrote:
>
> I've done the bisect using the v6.12.68 tag as good and v6.18.8 tag as ba=
d

Sorry, those are not the tags I've used for the bisect. Before doing a
bisect in git I first checked versions from 6.18 to 6.13, and could
reproduce the issue in all of them, so after that I went for the git
bisect between 6.12.68 and 6.13.6.
