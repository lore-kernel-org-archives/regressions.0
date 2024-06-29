Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E69639FF3
	for <regressions@lists.linux.dev>; Sat, 29 Jun 2024 23:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719703143; cv=none; b=e0GoFfzG2nMjXjlmO0S54lBrB6CZg/BwGOVBFh3WBvuvGmxSQMo9eoM1qZi16q8XE1PTQoVymrwdwNBeJC11v0yvtDK5JOB+J6ezoVJdN/4yWZ3M1lwyhO1iu67O2lhjuWDvEgbnknHPDnD14pcARgBFFJGnaP4BnqCy7iM+WGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719703143; c=relaxed/simple;
	bh=FNv8/W0W5mKgnrGfxxg0WoBrrHGpsq48w5EU6tbPKHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YX5r/LiFLBp5rivBw20waHqEPkvqSlgVXhKaSWXJULEOpLwIp4i/UsGyCYdUh5FDeIuDi9OBJ09rysmfJ7nQnU4XwZVBNWc94yC6iSvEoW6DdaLbCCmm8FP9hs8q3hB5Yw8SPlIZyX82AwExz/4L+ZTES5Yk529sTFiQDRQtatw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IALas4Z5; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IALas4Z5"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6b5217b189eso2055406d6.2
        for <regressions@lists.linux.dev>; Sat, 29 Jun 2024 16:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719703141; x=1720307941; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XroRg26Q/56W42BWJJi+I1OGaZL3CPZqLZHzczquNHs=;
        b=IALas4Z5EPvP9TU97gjxXvvx60qY6DhZN7TDpWKq1R/Os/uMFF/INEHgr/Ubkjeks1
         Ha8yJGnkhw9nzYptBgier+lue+QXyboqnBpQcJ65Txg3rx4BqqVn/MBkDKqgyUSR6LrU
         VDjvBYfQzylctV8dGiLgojxqFST/BbwJFPwaF62JowA68s8/vqKEKSGyhSqeT4N6uoYi
         hfFwF1JIG7mvK0HgVAYlKhKirWs0OhWfwAb/lzGIZQSXwukq4sdBD+2gYK+Q2bI0Ng/w
         sOta6tIkzmGLgeXteVLmejaPK9WACiJTIohQ219z3sN234GYl8vu9u7s/4t7LSJ35q5q
         +dcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719703141; x=1720307941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XroRg26Q/56W42BWJJi+I1OGaZL3CPZqLZHzczquNHs=;
        b=j0OX1fS4736TCIERu5l0QQlo+646wpnxcXwH5wb8zeNOl4CrLW8ieeo5+B/H73Yp6e
         /TJ1/6vEwK40fGlm1UHNsRfizlJ7ZuRT5jqjCvDkVHpuv1hDgqI4cmNtf86BnZSkVb7f
         meEIk1DU9X3VyUi7t0i3YiWUmpvnZFJhWPaWaPeS34/WLfIr3b839Fz0ytWT2ZrV55wo
         DW8UTIqDvzDSvT9Qd7oWw6gPbplRWbsox6+5hZDTkilt5X8q7k+LEDrzT2CRUc/c1qmg
         jMY1WGmMaPbIE+k1xmg/N4zqvuXDOvoLbj9AXsW1McKo0x3nwn6Nn8xEXXczTKYEOI6V
         ZcFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkatYx1OcayES7KUOyIoY5Uqe/L9yXMF1eNCukFFbnM/UC+IZklyaivaVn4fhRd6NSZjP1KU0083gG+0GgnRhTbBxQyfwbumF36T8=
X-Gm-Message-State: AOJu0Yyq5INSwy9yF7YvuPtxxEtNczGqvOLMb8lC4HXkfkZar4YgfTWj
	kyDd5VEqje3AxssRKT/65S0QRp803V7SBxqZ08VX+eeQ98gvlaACnmUd0ttoUxxFgJCbUsEymcJ
	ETOePtDZuo4SfSocX/TBJMvc31k4=
X-Google-Smtp-Source: AGHT+IGhxpyC1sq9wMq2Q8/QZ9d1fuFaSnh4PKaVqBVKSUiIvqWIae53ZCaOAlyNYIk/opAz33KCSq9czjF9x4ULey4=
X-Received: by 2002:a05:6214:20a3:b0:6a0:cd65:599a with SMTP id
 6a1803df08f44-6b5b70a3951mr22698716d6.2.1719703141242; Sat, 29 Jun 2024
 16:19:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
 <CADnq5_PDxJ8O1JUQ9RBYRFB9G1WZJos05ZAM4jUKuPBwPxjNkA@mail.gmail.com>
 <CABXGCsNN9LwHc2x2AAEH=5UNwpvkWkBqRYz3OP8MZ6Woy+HDXA@mail.gmail.com>
 <b6c440ca-e63e-429b-af41-5f27d4b8b2a2@leemhuis.info> <CABXGCsNoFfMn7LaqqFgEPg-ECyUPN=f=SXVrFi=GZk6c69-Gqw@mail.gmail.com>
 <CADnq5_PDSkr4hOHJmb1J30UC0a7sXsm5-TPkEmjzffMK_A+7ug@mail.gmail.com> <ea465a40-f673-42b1-8b1c-a2efb20cd562@amd.com>
In-Reply-To: <ea465a40-f673-42b1-8b1c-a2efb20cd562@amd.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Sun, 30 Jun 2024 04:18:50 +0500
Message-ID: <CABXGCsPyrUEqDq2gbr4VLw5ncd9cKoCZ9nOr2SRfg8Lh=9H5Kg@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and 120Hz
To: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	"Deucher, Alexander" <alexander.deucher@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 29, 2024 at 9:46=E2=80=AFPM Rodrigo Siqueira Jordao
<Rodrigo.Siqueira@amd.com> wrote:
> Hi Mikhail,
>
> I'm trying to reproduce this issue, but until now, I've been unable to
> reproduce it. I tried some different scenarios with the following
> components:
>
> 1. Displays: I tried with one and two displays
>   - 4k@120 - DP && 4k@60 - HDMI
>   - 4k@244 Oled - DP
> 2. GPU: 7900XTX

The issue only reproduced with RDNA2 (6900XT)
RDNA3 (7900XTX) is not affected.

--=20
Best Regards,
Mike Gavrilov.
