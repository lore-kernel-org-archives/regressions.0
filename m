Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AA625D1F5
	for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 16:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761148804; cv=none; b=CH4sjcfmV40RtWkU24mSeC+MvKqAYMwE3+dlDGAFagK0s4gA91d/g4EiFgdx+kw3kt88u9dwVrMDV9nCn0ZFKdZPeXWsjU2sXNzNWAlQrp8EkkdqacYO5Y+8ORBaLtQHgoRM1vWZoVBCCFBiE+63QMuQSZIrkCafLwxtwIXv+24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761148804; c=relaxed/simple;
	bh=KzWGAXTtJNaWOtBKzMnXWFA9Pc/O+vKz4Cro7WOAr4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/VvoBB9FGEQ9RxXHt1g6bVgFEYNdxEGVRNimI100H3fp1jHotAFg5YfuUZPbfjmF5SG5AbS2k8VHaqEyczJ9WJtsILoMNPd7TEpxM1CMxfdbMVufVliu1YVGEw+vbx2r6wxx9UTySwItMB8MZxoz7V1hPdzOx/eXrVe2kE4DPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iB3p8dXV; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iB3p8dXV"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-87eed34f767so179506d6.2
        for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 09:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761148802; x=1761753602; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzWGAXTtJNaWOtBKzMnXWFA9Pc/O+vKz4Cro7WOAr4U=;
        b=iB3p8dXVAJyw/cvWQ5/YcGc/PGSNLIOV+B6gD/lPhILzVk3DVktRh8iWv+0Yu1mZ46
         CzQvJ9DLy2hy9kQRVn1BbdrrUcxPuebT5aevh1pW7SVieTf9r4ppykBU2SkPKsolfcJF
         vYju5vmE1DJv+Gh9pv4ERTZ8qodEw7ytjvpk31gsD7diToBD85LxGSIY+oqOQiWikgk+
         UdM38KIIjQf+FiEeWoOyvGJjC4DEivIDT59YNcsZuhthffqvtLWCP925Mbrou7vPbWgH
         T6HllP0NAg2kwTU2Ver7mxv69q2L6lDGWxKmJkDAQ2y22CkK+7HiOrgbxin3w9bplWUh
         SBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761148802; x=1761753602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KzWGAXTtJNaWOtBKzMnXWFA9Pc/O+vKz4Cro7WOAr4U=;
        b=uR10irgrY0dyZkR4S93v9Jfw2TxlejTA9E6NZWNJ2grL0PSe02XY6Z+NiKS2P2Cffl
         4WQm3Y+P4ZPTgO5xG35hQO8C4ZkvDgbjqOVK2SY8H+jB9dLsV2X8oqbCdbHtZ2MZX8Wm
         ckN395no58NFddKy3a+4KEhp+Gq5PAWCcK+EQM2bV+Rj0WkKZI3lURkHw0q1c0EefeXi
         qeaukXjrMbCHk9HUQvGF0YmFgeprul5OsmW5VGL4ZqRXQ6yCUcWFbBMF2KVHH5D2tYEV
         SfQyq8zM3HMiIGvpLyyYyO8AIyHRnUd8VNld5gPcY04OL6ufjMA9j1Vo10xisTVkidoO
         hl0A==
X-Forwarded-Encrypted: i=1; AJvYcCVsjhZoDaBmnVA6prlgGC4XkuJY160QZ947P4EnmWJxgqEXqg8kMCrjXM2iGZrqROG2pNAvaMluFAgZ7A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJd2Xf5kNnBbyTrhtIWQrh81cos7NfC7cvx2SRifvM4nrrCMWC
	a17GUWbnLu+2r5qtz/mwge8dB/ztk75RoX8h4HZtn3SStv2SdRli6aUen9eymi/uJG9aZHhvODC
	j5eDXq7z95RvDxjdQkfM7QbKmEqooUyw=
X-Gm-Gg: ASbGncvnhtfqMmV4AMqGr85Cyh7SmqlumCOX1CsSfxlbun7p0WZo8kI7Fv+x4oxFB3W
	wJ4YYKrCT7Tpw4tBq3KlPXlSt5KKW+i6CmMpCMt9823+FppnMcskY04g6sY5SM/+RYd0U4VY+vJ
	1ADLgCfweqD30s4OjFiKwNp4sBe0mw0amxbeasRk+4BWBdDFTKrU/01bw5y1AApcT6pgBb2EuXG
	vMuCTAVrne67rm1qRIaRh6VE0G4Hb5qN586YNbkY8KtfNa1Im4gXyDoP0dcWO6P9IYFAVDodWvH
	Jzl/8Poddbq4TprnSSsG7OravDM=
X-Google-Smtp-Source: AGHT+IHxWCD/w+o2vmfbuWDtKOmy2UCQxI4nvjqy0zKHd7wCbrRbTr3WpmmN6Tt3lY3nMvE06CH78X9xcKtEFyAyF3c=
X-Received: by 2002:a05:6214:2469:b0:7c6:bbaf:11b4 with SMTP id
 6a1803df08f44-87c2081ccffmr315026216d6.54.1761148802138; Wed, 22 Oct 2025
 09:00:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251022150716.2157854-1-mallikarjunst09@gmail.com> <5b78c30d-26de-4e49-9bfa-121c9f40b4e0@kernel.dk>
In-Reply-To: <5b78c30d-26de-4e49-9bfa-121c9f40b4e0@kernel.dk>
From: Mallikarjun S T <mallikarjunst09@gmail.com>
Date: Wed, 22 Oct 2025 17:59:51 +0200
X-Gm-Features: AS18NWAJWcskmCUPndr9Lli3CHnsvOgWgxEkWkWuX7hMLeLHsGN9TYgqSU5HGMA
Message-ID: <CADv35-T8XchxB43FZ2XdJ+8nWDCULqz1FLX5vC9WN3gtgeSpQQ@mail.gmail.com>
Subject: Re: [PATCH] io_uring: initialize vairable "sqe" to silence build warning
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, "kernelci . org bot" <bot@kernelci.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Greg and Jens, for pointing this out.

I understand that this issue has already been fixed, and I=E2=80=99ll make
sure to pay closer attention in future submissions.

regards,
Mallikarjun
