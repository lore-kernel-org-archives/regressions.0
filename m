Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AB113B2B0
	for <regressions@lists.linux.dev>; Mon,  9 Sep 2024 20:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725913963; cv=none; b=ZLOtg4g+KFFSOEODEn6G9wYlfVEAAUobX7vyk9q0bJxoPGK7FE3hKe+uGx7wOBWnSbcGjDPRn/snzEK3MDaQZuoWts19Xm7HGDGkPd5paULzEO1eqwLoWh0Mvplh4DCU+y59roDH65t/m6lvOmnhc0+Ezbj5cedtzJvhgFI8OTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725913963; c=relaxed/simple;
	bh=AJhd8owgl3wgf9vnWFFzARsYkI3LcQ0Uzl6xhNwmfsM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=jBdFJ5xVt60aO/f0ACl0QTJTq4yXzOj7ICjRIYWaIAZV4JmYlYPR5uYUCo5Q5O6eOnAlfx3cMijTRw0Bw74b5P8my0V0OSkuBvn/LPzk/pv4aBh26yf6NKXZVDPZxsosqAikZC64n97PJIDfgt98TntXyvgMi48PUoUcB5TySEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GixCzjyH; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GixCzjyH"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6c51d1df755so26521316d6.1
        for <regressions@lists.linux.dev>; Mon, 09 Sep 2024 13:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725913961; x=1726518761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJhd8owgl3wgf9vnWFFzARsYkI3LcQ0Uzl6xhNwmfsM=;
        b=GixCzjyHrDLU+bEQmTrijalaVO5aTRIlWZ2eS7/9dPX3F8py5QP67FYvAPu/Wruqdm
         zSkT9hewuLeTJkGzeVEU0PdgNtNH6kok360OUyMg4vdiFuaE91iuaHxIbYYQ0Qp2LTxC
         4zqALI3g9BK5y32nYOD6sZAjk48R8mnHb8QCbTd0ut6vmD/YjsbvoKwCyG7lRvtjJNb0
         75knQTILr3mYxdmFrTmIfDzKEeeOlDYy1v0xo5uZrw1/OleH30EwuZ+KIuicgm8kctpZ
         DnJOSYTYsoh28t4CUv7J/1OUDBa0UEQHPwmawDEeHakR8fFpHrCPrst/xLdiEYAa0CBh
         wc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725913961; x=1726518761;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AJhd8owgl3wgf9vnWFFzARsYkI3LcQ0Uzl6xhNwmfsM=;
        b=dC16bXbYKx50bd+vqlYVo1NTbg3oDxaZ42Y8LqrJVR9X6QAPnE82FMjrnc4e8/MEee
         MZLEaVIQN3IUS+Q53IrBB9EN7fSHOJVryymrrSYfWLMZr0fGB7uuzAYLXRAc4WNtQmcq
         6M38eogNnfjOl+enWZaM6NM6apiZ9SRd02HHkzzI8PioLvUuhVXhHOoZ39gJCXQ6lw5X
         ZOdSsRiE9KO05JunpgITmFGbLITDRnkh9GRf7SKum1nyG9LN1OqvPh4F+YRxPC+0yyCe
         Cn2aaw5bblh/El1TVKqMuqx1DrG2xRkgPqjHvzBjbnb6x0um1IBwqRKQf1sWIWW2/zHG
         jh1g==
X-Forwarded-Encrypted: i=1; AJvYcCV1d5X06qZAGOaXYhWuycvwN1/jdm/e1sd2g+FXkOTfR9+9waZohEn20iFvi8BhLmBCno67L64YKW0tbg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxyyMG5ebudkUOTl2Au8ZHq2ptyZPUuqzY5wWvwAJLwD/9CoEHZ
	mPg0GIj3N1BLuztLsxUEBhuFEsRW062H2kueE3Cf7M+BeXUblat9
X-Google-Smtp-Source: AGHT+IGpOpN4QIrmPyS4/VyYBCv6C0MghytA7UdSQ6aM+1e63zWW6d8Cl9JLbV60071xSvGltyiGkg==
X-Received: by 2002:a0c:fb4d:0:b0:6c5:317a:a664 with SMTP id 6a1803df08f44-6c5317aa66fmr94833696d6.3.1725913960989;
        Mon, 09 Sep 2024 13:32:40 -0700 (PDT)
Received: from localhost (23.67.48.34.bc.googleusercontent.com. [34.48.67.23])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c53474d844sm23884196d6.77.2024.09.09.13.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 13:32:40 -0700 (PDT)
Date: Mon, 09 Sep 2024 16:32:40 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Christian Theune <christian@theune.cc>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
 Willem de Bruijn <willemb@google.com>, 
 regressions@lists.linux.dev, 
 stable@vger.kernel.org, 
 netdev@vger.kernel.org, 
 mathieu.tortuyaux@gmail.com
Message-ID: <66df5b684b1ea_7296f29460@willemb.c.googlers.com.notmuch>
In-Reply-To: <0B75F6BF-0E0E-4BCC-8557-95A5D8D80038@theune.cc>
References: <89503333-86C5-4E1E-8CD8-3B882864334A@theune.cc>
 <2024090309-affair-smitten-1e62@gregkh>
 <CA+FuTSdqnNq1sPMOUZAtH+zZy+Fx-z3pL-DUBcVbhc0DZmRWGQ@mail.gmail.com>
 <2024090952-grope-carol-537b@gregkh>
 <66df3fb5a228e_3d03029498@willemb.c.googlers.com.notmuch>
 <0B75F6BF-0E0E-4BCC-8557-95A5D8D80038@theune.cc>
Subject: Re: Follow-up to "net: drop bad gso csum_start and offset in
 virtio_net_hdr" - backport for 5.15 needed
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Christian Theune wrote:
> I can contribute live testing and can quickly reproduce the issue.
> =

> If anything is there that should be tested for apart from verifying the=
 fix, I=E2=80=99d be happy to try.

If you perform the repro steps and verify that this solves the issue,
that would be helpful, thanks. =
