Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4F029411
	for <regressions@lists.linux.dev>; Fri, 26 Apr 2024 20:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714164159; cv=none; b=trOv/3jg/5W/ogMs0sY9OFayKp2nWrBs0xNydpvsMMp30bWeNHsJt8h7SGsqyxlGdw/J5fq069rtr+AnSYBP2LQyY+M7o1H6UsqNT4CjrihPTrhWnX8UcFbDtJAW+3fDNoKEdPEDy22+XArTLNRnaKokxeLL2Iwn99smhHkZZXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714164159; c=relaxed/simple;
	bh=Ut2/7QtHb1M2bAQEQd183O3h2QD+aXNEeV9+hYPipro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oVkF+5insrTBcvMgX7NYPUf3zuWm02IybYFCQH6Z2QG+Jd1eNPDcFXTQG340dr62eJiDxtH5fGLsx1qYtP21Lzzld1oTPs45THMv66K0POprFyaVCXMZaTh7qjpOSX7vB4nchzBCAsvMq7yLQ0VijSP37mnPxW0V2UdSSYtD2Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org; spf=pass smtp.mailfrom=penguintechs.org; dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b=Utfa0yAl; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b="Utfa0yAl"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2a559928f46so1845179a91.0
        for <regressions@lists.linux.dev>; Fri, 26 Apr 2024 13:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1714164156; x=1714768956; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ut2/7QtHb1M2bAQEQd183O3h2QD+aXNEeV9+hYPipro=;
        b=Utfa0yAlIYObqardKkYCqUTkcqrKQ2Me77zx5pyNCHLHolWG+ZefG2pos8ynWh9kX1
         o5OrGNmM/4cQW52BWUcvkwY568uKDARhkZi3+KJp6unKgADlcbyV3XIRi8DnGQf1d2SX
         C3kHIn/xe7fdWBE6cbEJC+FlO+q2PBY9dckMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714164156; x=1714768956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ut2/7QtHb1M2bAQEQd183O3h2QD+aXNEeV9+hYPipro=;
        b=DZKnvTdYwLbEzPm7heMTSvePXOT6uArHbIO2lFqhZTUfnUjL2XCsLeHy2Eo2auSz7c
         /68qKU8WvvtJX97PPgJ4nC5l5OTE0cB7YAVs4wg9aRna9UnmvhkuvHnLTKYZMutEmfbt
         P2NamY1oqZAnVgG2DtCJFtoisS7fuCQPoty8AFdYrOP62jvaV9GvNFpwaLAzVZiL/Roy
         SKN95yFqXV4nYIaVIOhIQYzL22SADa7AUdYral3LLDXNUswmcpdTrHzKLZn9mGfsbGuy
         CJ4cTjQ6TtQiJpKFyMzYxou6ttvuf4FsxNkQdkBPFRgbJGitRrdvbeTVKBARNbITnFDj
         C1pA==
X-Forwarded-Encrypted: i=1; AJvYcCXfaMZB/BW0zimdOn/K1TMpXuyrqmKgTdSaSLZ74tDtpTAats7bYu0aQSv3Fg7vmfkoeqv4ksG6ajwsnG/F1RLAbfSgxXPTkETs++g=
X-Gm-Message-State: AOJu0YwKtHZEB0U26IhKvcQF4MtC1NhR4UTm35lLd26Jbah6I/XJpD8C
	S8tFruZmpeqYDOKjMkdSrJrTCMZZel39RCnQz1h44rGu6rmsyB7zoOaXxF5izw==
X-Google-Smtp-Source: AGHT+IEOscTEwtYTWB//iF95be8T91jBA3iUjB0TKOHlVlba448YymSeSS3FXYQvh1CygPxmaDwhbg==
X-Received: by 2002:a17:90a:ad86:b0:2a2:5860:dea8 with SMTP id s6-20020a17090aad8600b002a25860dea8mr3784343pjq.7.1714164156414;
        Fri, 26 Apr 2024 13:42:36 -0700 (PDT)
Received: from braindead.localdomain ([2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08])
        by smtp.gmail.com with ESMTPSA id 9-20020a17090a0b8900b002a2e4b593cdsm18187936pjr.51.2024.04.26.13.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 13:42:35 -0700 (PDT)
From: Wren Turkal <wt@penguintechs.org>
To: Zijun Hu <quic_zijuhu@quicinc.com>, linux-bluetooth@vger.kernel.org
Cc: luiz.dentz@gmail.com, luiz.von.dentz@intel.com, marcel@holtmann.org,
 linux-bluetooth@vger.kernel.org, bartosz.golaszewski@linaro.org,
 krzysztof.kozlowski@linaro.org, regressions@lists.linux.dev,
 kernel@quicinc.com, stable@vge.kernel.org,
 Greg KH <gregkh@linuxfoundation.org>
Subject:
 Re: [PATCH v7 2/2] Bluetooth: qca: Fix BT enable failure for QCA6390 after
 disable then warm reboot
Date: Fri, 26 Apr 2024 13:42:33 -0700
Message-ID: <5600892.rdbgypaU67@braindead.localdomain>
In-Reply-To: <2024042330-boat-launch-aaec@gregkh>
References:
 <1713932807-19619-1-git-send-email-quic_zijuhu@quicinc.com>
 <1713932807-19619-3-git-send-email-quic_zijuhu@quicinc.com>
 <2024042330-boat-launch-aaec@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Tuesday, April 23, 2024 9:34:43=E2=80=AFPM PDT Greg KH wrote:
> On Wed, Apr 24, 2024 at 12:26:47PM +0800, Zijun Hu wrote:
> > From: Zijun Hu <zijuhu@qti.qualcomm.com>
> >=20
> > Commit 272970be3dab ("Bluetooth: hci_qca: Fix driver shutdown on closed
> > serdev") will cause below regression issue:
> >=20
> > BT can't be enabled after below steps:
> > cold boot -> enable BT -> disable BT -> warm reboot -> BT enable failure
> > if property enable-gpios is not configured within DT|ACPI for QCA6390.
> >=20
> > The commit is to fix a use-after-free issue within qca_serdev_shutdown()
> > during reboot, but also introduces this regression issue regarding above
> > steps since the VSC is not sent to reset controller during warm reboot.
> >=20
> > Fixed by sending the VSC to reset controller within qca_serdev_shutdown=
()
> > once BT was ever enabled, and the use-after-free issue is also be fixed
> > by this change since serdev is still opened when send to serdev.
> >=20
> > Fixes: 272970be3dab ("Bluetooth: hci_qca: Fix driver shutdown on closed
> > serdev") Cc: stable@vge.kernel.org
>=20
> That is not a valid email address :(

@ziljun, can you please post this patch in a new patch series by itself? Th=
e=20
warm boot problem is fixed by this patch, and I think it would be better to=
=20
have a thread dedicated to this fix so that it doesn't get lost.

=46WIW, I think that this may be the correct technical change. I would like=
 to=20
try to help get this patch landed, and I think a clean thread for only this=
=20
change would help.

Just so everyone is aware, I am a concerned user of the hardware, and not a=
=20
kernel dev myself. I have tested this change. This patch on top of Linus'=20
mainline does allow qca6390 to work after warm reboot on my laptop.

wt
=2D-=20
You're more amazing than you think!



