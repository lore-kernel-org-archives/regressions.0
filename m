Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0344743AB6
	for <regressions@lists.linux.dev>; Mon, 25 Mar 2024 20:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711397239; cv=none; b=RLGl1UvRsdt4JlxA4jgnXFRG0B0LX/e0JIgO5gWOlUoVhosoqJo441i0e5XMUszggi1xBFFGHHBGiTJtyC9aMOs0wSj3gH1tzVHttY6Hp+71Zf0mDNWXHtHps8FS1JlsBFOlZ7wt0uROtqq/nVZ27K1FlqX3moGuUycmD0WHm3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711397239; c=relaxed/simple;
	bh=du4SRixuDJpsGc6Pl95gu+UfcgZcN4SGXN5Fz8Z6dDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mk/W9HJXe5L89Se+EwyMlCDwTETyom0ISam9fygAvUjdIK5QZWkQKu4KAOi1P7TCMGoy54+JvaAvHN7Txrv0VNGjk93nz8Pq3zPZeFMSAzLH6JfSnuJB88eN6SMyhpp8OCj7uqBT1tLbRQkBI68J5BuHU4xOJmGXUIDhsPVTRS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gy1/VsRd; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gy1/VsRd"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d68c6a4630so57690511fa.3
        for <regressions@lists.linux.dev>; Mon, 25 Mar 2024 13:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711397236; x=1712002036; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=du4SRixuDJpsGc6Pl95gu+UfcgZcN4SGXN5Fz8Z6dDU=;
        b=Gy1/VsRdfOtArEK5ZQxGmjKeTtoXTwczGQ0BDPAcOwEyFu6MdvCcp3zWbB+RrMklyA
         CyVbIzCIjEEhkNZ7nI426PT49+cZ4rL3kX9KFwboKcoZjg16zXXj4h4V8F+rk9gJDYP2
         x+iU+0JWEjRkhbOODwzer5HowYxOsMKbfmRRoqHVbvWzjuqQj0JQS6tg5+P8YlRcEeo/
         5/MfhOZbH8uuiCL+JwFp3LbOeg9HTySofdWHhj8k2sCFB7uTfclul77kLg7nYnFK9k1B
         BtTvWJQo0aVraT6lm43jYKwv8nZPaSu48HGYzN67nh2K5aK+9eP2MMEe2dDarwHInH8+
         Hhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711397236; x=1712002036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=du4SRixuDJpsGc6Pl95gu+UfcgZcN4SGXN5Fz8Z6dDU=;
        b=CZ7nyZbDXWdmFaEcSu/ZYMp5pSAy6Bbytl+VVv57EbEBsfUQJ7O2Vk+EEDMws7QDhO
         vI+L7GD2ijKqQjuaRwW+UcNHAmCo91d1rWb/gr7LESPkMmfHPonYqP+OxIdgSPuw3V51
         d2OSuJMD4D1vt1lisBwJaoNdLYKF689QomRYqodTzPx0pM64QHC2C2NqoHMBqIMVszMn
         mRW9+LpOxmQHTCbFeIhWLETuQ6LTA+OL1dH6OCwuEsH4cMot9m/L3Bz/b/JT7MBFm8np
         fpyIwpD9zef1cAxMuUNPBLHnPQDlcxJ+MUIRohBB1+dUkHXs5p8K68d9g0mRZiOHR+Mh
         IfvQ==
X-Gm-Message-State: AOJu0YwqbK/OEHTXK7IwzLXp2mfTnKHTRsV53WNui5Q/4CEdeTU166Ai
	18FmqO2MZDIt1rZsNkR/cWVazQAhzIMVQvWj60gYZ4TLAl58pWLDjK+yXVPrm0ICU15Nt8fFDVD
	3lhJV+WdUc8UMqBTX+9WA4uoWt08=
X-Google-Smtp-Source: AGHT+IHlayvaP0yY4B5G/tL55lxT++Fsn1ZkhDpnNssxYt+RRaI9Pmd8pmh3B5/obFUWOWyZNGwQqHHqCji5jwiL+Hs=
X-Received: by 2002:a2e:8552:0:b0:2d6:b8d2:3712 with SMTP id
 u18-20020a2e8552000000b002d6b8d23712mr5740462ljj.26.1711397235773; Mon, 25
 Mar 2024 13:07:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240314084412.1127-1-johan+linaro@kernel.org>
 <CABBYNZJV1htg46Gyu=7_iUWdukM+rHLitsLjxmWWYFGXty3tVw@mail.gmail.com>
 <ZfMStHjwtCT1SW3z@hovoldconsulting.com> <964131ff-293d-47d1-8119-a389fa21f385@leemhuis.info>
 <CABBYNZJ0ukd_8=SFzy8CEwgP7hV5unodca0NZ2zDZh+jPJsEFQ@mail.gmail.com>
 <ZgGzWWV4Lh2Nal--@hovoldconsulting.com> <CABBYNZJaXUhu1A+NyVT-TAJw49zcV6TMdGeVy2F+AVKWBOVC-g@mail.gmail.com>
 <ZgHVFjAZ1uqEiUa2@hovoldconsulting.com>
In-Reply-To: <ZgHVFjAZ1uqEiUa2@hovoldconsulting.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 25 Mar 2024 16:07:03 -0400
Message-ID: <CABBYNZJUVhNKVD=s+=eYJ1q+j1W8rVSRqM4bKPbxT=TKrnZdoQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "Bluetooth: hci_qca: Set BDA quirk bit if fwnode
 exists in DT"
To: Johan Hovold <johan@kernel.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Johan Hovold <johan+linaro@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Janaki Ramaiah Thota <quic_janathot@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan,

On Mon, Mar 25, 2024 at 3:48=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Mon, Mar 25, 2024 at 03:39:03PM -0400, Luiz Augusto von Dentz wrote:
> > On Mon, Mar 25, 2024 at 1:24=E2=80=AFPM Johan Hovold <johan@kernel.org>=
 wrote:
> > > On Mon, Mar 25, 2024 at 01:10:13PM -0400, Luiz Augusto von Dentz wrot=
e:
>
> > > > I guess the following is the latest version:
> > > >
> > > > https://patchwork.kernel.org/project/bluetooth/list/?series=3D83666=
4
> > > >
> > > > Or are you working on a v5?
> > >
> > > This patch (revert) fixes a separate issue than the series you link t=
o
> > > above, but it is also a prerequisite for that series.
> > >
> > > v4 is indeed the latest version, and it has been acked by Rob and Bjo=
rn
> > > so you can take it all through the Bluetooth tree. Just remember to
> > > apply this patch (the revert) first.
> >
> > Doesn't seem to apply cleanly:
> >
> > Applying: Bluetooth: qca: fix device-address endianness
> > error: patch failed: drivers/bluetooth/hci_qca.c:1904
> > error: drivers/bluetooth/hci_qca.c: patch does not apply
> > Patch failed at 0004 Bluetooth: qca: fix device-address endianness
>
> Did you apply this patch (the revert) before trying to apply the series?

Probably needs rebasing:

Applying: Revert "Bluetooth: hci_qca: Set BDA quirk bit if fwnode exists in=
 DT"
error: drivers/bluetooth/hci_qca.c: does not match index
Patch failed at 0001 Revert "Bluetooth: hci_qca: Set BDA quirk bit if
fwnode exists in DT"

> Johan



--=20
Luiz Augusto von Dentz
