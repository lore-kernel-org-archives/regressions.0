Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C107C13D280
	for <regressions@lists.linux.dev>; Thu,  6 Jun 2024 21:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717709007; cv=none; b=hSECoU2jvxqSI+Bf69QP6CJIy6OII2Samo9gkqAP5A7A5IK+GMkJs1JYCR6oyqprsapsGfYIzTVTQaRCYKZe571aR8IJDBCkWzLEJ3BfZ+nu3+VXnEMJA9giPEEVgMf9jAvrlPhLy9dAW144UC6IN8Z5b+QXg3G0VRFGurKQGYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717709007; c=relaxed/simple;
	bh=18ErmTQ+WGncl+Pa0OIgOMyrs4urCsczi4HxtdcrsRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=flK/rvvjm7iWotP/Yhhlb2ALXpH7WrukyNb63g38L92h44h9VagqX6B92qk0KVATXkLQ6np5PoXiDwdG+UpgKgsDGAliOezUXK9h+rRQWgBNHTp9zN8D2jZSzbsQhln+FIVCg8+r0/LSYx/GK9MyRIz99onSap+LsIBY0LLOLdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkysB5jn; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkysB5jn"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2eaa5cd9f0bso24481081fa.1
        for <regressions@lists.linux.dev>; Thu, 06 Jun 2024 14:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717709004; x=1718313804; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18ErmTQ+WGncl+Pa0OIgOMyrs4urCsczi4HxtdcrsRU=;
        b=hkysB5jnskYlAerq2HiRqpZEjw0O6Y+G8vL/2iDW5CISdGWjp5ZYy+l9t/swU2XUTU
         WclNm/GOu9+YxH1is3LTYT/BqIpkbDCo2xngqmma6Lcy7Jtq9pLQm4Ntju1+U5PmYD4w
         JiszstCbLHq3zDolWYmEreYPbUQz/ESVulwpF8KT6OiRaaBCk1557DFV69axAiyuGxUx
         rbfmT4W1/zz3LKdwWAmI/uvtOJlJ7rWnva1SNL8ntOuJchxIOAqRxWX+vmxzR+EQg1Vx
         3soaW00bEOKFjiEtxn78WoH9cXrm9Ql4gpk64dGverQAGbOpehLSbQyZiNwi9LkxjzwR
         UiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717709004; x=1718313804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18ErmTQ+WGncl+Pa0OIgOMyrs4urCsczi4HxtdcrsRU=;
        b=Wy9xXXFeRt5IV/h9URW+4JlfFWgDyJvMdXmrUMWtSWBSmU93np9fcbgUr7IAoMXnEo
         JjIxjHz0dyvZOpb1EFb0m8yQxO3syAFjOMorctnSSM1ZzvNOZ6yuxtNW6HvAymrQh8xD
         7rhwuGHu/rI2MUMlnkXJhf1BY8vNK7PpIqnctbBEboUbEDl56oU9Q3kl5QTOSogO5YPD
         t5WoFrZGk9cFdxkuXzgZz45mkfDKepZcDOeXLzoARIXudO1TL4iT3E/oCHP31rSNHlMU
         lhtvNZ5drkBbwwcN8AiCuU8eYpPRnty+Kdb/K5krA/qR55LdBc5qpg3SkvSBFofXJgM3
         Kwzg==
X-Forwarded-Encrypted: i=1; AJvYcCXKI3yO/JdzHivBQxWWCGKVvU/EyH/rBaKn9krRhIMwUsGW0vuSDyJd6iMf6hDfNLGk/QbOBj1Spx3dSdGEuxOei5P3JxkDlpkoUGo=
X-Gm-Message-State: AOJu0YxUlgVOD0aWuxgSaqZ+sDne9A0lSAOaWqzmZXOD6dndjPchRhLn
	/Zbnpwz2cQ+8LtxRl30UKvW/NBrGV1+kBhKQRFko5Fpy6fpPHwllldtU5j+3cJziDOYQh2nmh0k
	As2O16gvmSIVgRnpoF5ojEtRz5h0=
X-Google-Smtp-Source: AGHT+IG2uNcusRrlYiy5pSN/MoSZfc+1gv2u2voDfSUD2LA4yyPyxkGk9q2e9tLZT7lM4NLeRsHMKiBiDHCj2x0EHXw=
X-Received: by 2002:a2e:9e4a:0:b0:2e3:331e:e33d with SMTP id
 38308e7fff4ca-2ead00b8920mr10688881fa.11.1717709003796; Thu, 06 Jun 2024
 14:23:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGew7BttU+g40uRnSCN5XmbXs1KX1ZBbz+xyXC_nw5p4dR2dGA@mail.gmail.com>
In-Reply-To: <CAGew7BttU+g40uRnSCN5XmbXs1KX1ZBbz+xyXC_nw5p4dR2dGA@mail.gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 6 Jun 2024 17:23:11 -0400
Message-ID: <CABBYNZLE9uYiRM-baoBt=RQktq__TguMETgmVWGzfeorARfm4w@mail.gmail.com>
Subject: Re: Bluetooth Kernel Bug: After connecting either HFP/HSP or A2DP is
 not available (Regression in 6.9.3, 6.8.12)
To: =?UTF-8?Q?Timo_Schr=C3=B6der?= <der.timosch@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	linux-bluetooth@vger.kernel.org, luiz.von.dentz@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Timo,

On Thu, Jun 6, 2024 at 4:46=E2=80=AFPM Timo Schr=C3=B6der <der.timosch@gmai=
l.com> wrote:
>
> Hallo,
> on my two notebooks, one with Ubuntu (Mainline Kernel 6.9.3, bluez
> 5.7.2) and the other one with Manjaro (6.9.3, bluez 5.7.6) I'm having
> problems with my Sony WH-1000XM3 and Shure BT1. Either A2DP or HFP/HSP
> is not available after the connection has been established after a
> reboot or a reconnection. It's reproducible that with the WH-1000XM3
> the A2DP profiles are missing and with the Shure BT1 HFP/HSP profiles
> are missing. It also takes longer than usual to connect and I have a
> log message in the journal:
>
> Jun 06 16:28:10 liebig bluetoothd[854]:
> profiles/audio/avdtp.c:cancel_request() Discover: Connection timed out
> (110)
>
> When I disable and re-enable bluetooth (while the Headsets are still
> on) and trigger a reconnect from the notebooks, A2DP and HFP/HSP
> Profiles are available again.
>
> I also tested it with 6.8.12 and it's the same problem. 6.8.11 and
> 6.9.2 don't have the problem.
> So I did a bisection. After reverting commit
> af1d425b6dc67cd67809f835dd7afb6be4d43e03 "Bluetooth: HCI: Remove
> HCI_AMP support" for 6.9.3 it's working again without problems.
>
> Let me know if you need anything from me.

Wait what, that patch has nothing to do with any of these profiles not
really sure how that would cause a regression really, are you sure you
don't have actual connection timeout happening at the link layer and
that by some chance didn't happen when running with HCI_AMP reverted?

I'd be surprised that HCI_AMP has any effect in most controllers
anyway, only virtual controllers was using that afaik.


--=20
Luiz Augusto von Dentz
