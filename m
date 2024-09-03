Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA4F1D54CC
	for <regressions@lists.linux.dev>; Tue,  3 Sep 2024 06:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725345364; cv=none; b=p3pe8cTpZdwlkZ9/PSUlf/otmvPh0kp9gY32yZAyl2USTp33pHrjGqb3u/AHoGDUe5pmA8RRDmKpdjzST18ZmVtG7T48GX5wjvp+G2ES8DWhS0IzcMySfnYjFiz16eN8LQWOOhjhbKGanPIanN7Ojs//94M2UoTZIU7CNsKhyOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725345364; c=relaxed/simple;
	bh=VPZudvRVHbus4LXrbfoMkcg6cOhLHcVHXr99PO6hzJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=r3DdzTsTa5E9viu8PxxxOEp1SQcWUhTkw2Fa9Thu4kj2NK88qLz+GskcexRALgZYrS+xMDNQp75fIxhPiO/Xn/KJWyTnQogZ19lJ6kJn8m+uis6+/59+emVxfsX7QELUJD+e/oTR2mXPcuC9anoAEZNA2ep5hOukJimcaNeIpYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kz75VBOB; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kz75VBOB"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso4793444276.1
        for <regressions@lists.linux.dev>; Mon, 02 Sep 2024 23:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725345362; x=1725950162; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPZudvRVHbus4LXrbfoMkcg6cOhLHcVHXr99PO6hzJo=;
        b=kz75VBOBPFiPz6AOWYnH5gfM73JZJl7AzqG6f90wAnqnzdfrLiT4o48qPDbxcYjYHT
         FWmOXU4RD3SC/Jz7YDJHcuLeiK0MseSywrTa7jXP8qEVueQklX8cHscqP8RKlLvCJrUI
         4o1rehhnNw63+bG1AgbWcvSarw1oxrToHgganfPxONmoOZjaTmxB010B1OaKYCW7h0Yw
         CYRRzRvBuXxfD97Q4u8pQm757L+ahdQ20huwzUmK/igIjKUmB9dyYMLuIjwGQyr4sLUs
         DcOWCOYv2+U0kgZNjgO4NU/fAMEIwBWxDeXBShwMXa6lWkwJAeZXsOuJoB6zETEjhX0o
         3yJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725345362; x=1725950162;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPZudvRVHbus4LXrbfoMkcg6cOhLHcVHXr99PO6hzJo=;
        b=VuZu1W3EgiW/49kjoTZO2k9YWeV3P8ZnRFiP04bZu1F31iYJLR0imV5uKVBL19PYRn
         Pbvm9bHHOkKcVN4XK0bPGpg4L4+4Jpr6WEt3HQrjcSJx3wBwtTbevE3YJv+XxNPdHsBb
         TmVzTuaXul7QmB95k0FT+lwD/8kpZRGIjbiNR81hdYkdbTudlBEYAX2JIrIWKxkejXmD
         yvcdxUMksEVEK+QC5yzLCm/6/0IrWdCQUB5Sw0iHt+Vgprs2ZkSW0GTLIZ++y1ql3+Ut
         kuY1lqAABAb2EFEpDmrAfU5AKv611fQs05KjfUcqjugbnNPpbZpf1xIUkNN9m9PRaC03
         9iww==
X-Forwarded-Encrypted: i=1; AJvYcCW4hgBH2MbbtQuKCs8lOUkmsjhiM4HTQmwbC4tCRLGZpZmfeNpKk1vHRhY9iQqlGARonfitKvm069MP2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTQ9RMyvkPyn6NJ+v58p9QdOv0dbsv5kmmt/4dTFN9NfJEyp5J
	OhCDce6SEjtsNvuujkkWt1Ggf27QBZgqzpaM3nBOkD4Wdd+yOLHKG1TVMy+26D+9rsWch5TXWuy
	HGqygdV1pR2o5o8KLyxmc4OJhQyM=
X-Google-Smtp-Source: AGHT+IHR8tpiw3igY6qGfaRdI1dxqyE9jFzmjN8jYW30VTbpCYodS9kwBwFF3bZihMwsgZEMvLsrfMZBR6/T790BhzE=
X-Received: by 2002:a05:6902:2313:b0:e0b:ba20:7f87 with SMTP id
 3f1490d57ef6-e1a79ffa00amr10498144276.25.1725345361902; Mon, 02 Sep 2024
 23:36:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsNgx6gQCqBq-L2P15ydaN_66sM9CgGa9GQYNzQsaa6Dkg@mail.gmail.com>
 <CABXGCsNztS8MLteq5=fcddwuQ1TCzeOM8TdVtpJ3crK=sV5PTQ@mail.gmail.com>
In-Reply-To: <CABXGCsNztS8MLteq5=fcddwuQ1TCzeOM8TdVtpJ3crK=sV5PTQ@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 3 Sep 2024 11:35:51 +0500
Message-ID: <CABXGCsMdxHJ-MLkS0pm51Sk8g0PTghsuZxmowvj5t44bVN4ndA@mail.gmail.com>
Subject: Re: 6.11/regression/bisected - after commit 1b04dcca4fb1, launching
 some RenPy games causes computer hang
To: Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>, zaeem.mohamed@amd.com, 
	pekka.paalanen@collabora.com, "Wheeler, Daniel" <daniel.wheeler@amd.com>, 
	"Deucher, Alexander" <alexander.deucher@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 25, 2024 at 2:12=E2=80=AFAM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> Hi,
> Is anyone trying to look into it?
> I continue to reproduce this issue on fresh kernel builds 6.11-rc4+.
> In addition to the RenPy engine, the problem also reproduces on games
> from Ubisoft, such as Far Cry 4.
> A very important note that I missed in the first message.
> To reproduce the problem, you need to enable scaling in Gnome for
> HiDPI monitors.
> I am using 4K resolution with 200% of fractional scaling.

Sorry for persistence, but I'm afraid there's no time left to fix this
regression.
There's a week left until the release.
A month later, no one has looked at what the problem is.

--=20
Best Regards,
Mike Gavrilov.
