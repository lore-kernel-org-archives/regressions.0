Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E34B6BFC0
	for <regressions@lists.linux.dev>; Mon, 17 Jun 2024 15:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718638676; cv=none; b=bayXUxr4adGB/yJVZIhFclQbBj0MV/91gGCzIo4pgc0ZzbjRC3uNSFp3ky/aMklsVgXWzGKYzN3N8dKJA60SRPcdPs5WUUp5lOSx1Aj/CY1M5vy+N5y7cOuj5dqLm5fykm++0jnudRqqDvc16qVhkN7tzJLkpwTV3xsnVhz1Be4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718638676; c=relaxed/simple;
	bh=M4oqWQrrCHjEeRM/M07yKZApsUbXLvS82ZaDRHtRzz8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Jgurp+QsemvDd+EBUnvUtvU/hYc1hD+gnJ3IBJ3gitpinufIenI0ciJqJNSmDvRUOMhjc9TwOZOKwQcEMRhmWj3q2pIK+lPKnhp/I/HH2KhUeCWnStDM4kJ8RceUreKAJ4uCRFNQi4y9hMxplQH80f/RJRy9TG//Sk2oSqu+43c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fal/EAZq; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fal/EAZq"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-656d8b346d2so3162618a12.2
        for <regressions@lists.linux.dev>; Mon, 17 Jun 2024 08:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718638674; x=1719243474; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uex1uGHA1tHl76WKsbQeDe9MuGysGr+t11M0WOROa2s=;
        b=Fal/EAZqeYyshXwVQYvvveUBz2xDzZRQBsxt3vCw1ge45ElTp4i5VGuFEVQHekC3Js
         JFzq08iipbVhB15u+bbag2pTNOdvGGw7eezXgZYBfn4yXdd5gC1/yqZXDZ/nO4NY5987
         KOLGkkfajM/pDxg0+C5JJ5prlGp0jRuMexmb9OI5CSC4oM5K02MApXK3b0DiRp7tt74C
         eYlcXfMroxaXOtA08QXvLE5Tk4+VvERm3Hh7SIUblTspngHU6GQXrzWotlYMtVV4npDo
         HgjlZPiuH/7hyaVWMWQ6tQ4hWd2Qsevex5YpRQd4OBYhBNMKnUeG10WaCaA6CTB7zaR8
         54Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718638674; x=1719243474;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uex1uGHA1tHl76WKsbQeDe9MuGysGr+t11M0WOROa2s=;
        b=NkbfKaUaZmQeLcHIknsOGuB7OeEyL5GhrDPiq8wVMy9vopLnwDGyLWGdRdFRChMpOA
         JD3g89CLX98BdahDtH41PK6a9ik5LH2utyI+YeFKx2OiKoaayNfvEfVZgA8qA37z4KBG
         To9bSdvUJFTiGQkz+WMgfnUU/pyVMW78Uk44YKOk0bejEshSGKwllV2IPRRcV3iYhbSe
         y/i/iOY0imtYcdMQkhTeELd2JZsStrvcA8ewYbNuqvYG3R1VPWG9c3HUmJwlf5bjE6Jm
         w9aIeFTshAb/IuVWpUWLcHmpuyWnT917xKjuLT60R78RvShjJGJVTKAcHb5NFHLdfQZP
         0v/A==
X-Gm-Message-State: AOJu0YyCoqMd3NNO5D2BDt4LuOMNjHiGjag2MM9zCHdWpSapBBlzmKYv
	hUT01JlM86SrJl3jBnR2Kv+DRjBM/IV7EfkSa8gyQpdndcp/lYqsHAm2TX1OnnSVN1LLjbi8R5b
	4QrRiZ4mmv9bf1s6Fczxge5WlXUtka/Hf5Ok=
X-Google-Smtp-Source: AGHT+IFQdJoVYqdwuIC3CyZwuGJEgujxfCY9EtdOFDLqASOiZfJqQJfd4c1W9W+CVJgYPRKxpoUvSEFzgUyLmsAEDNA=
X-Received: by 2002:a17:90b:1d01:b0:2c1:b88a:3a22 with SMTP id
 98e67ed59e1d1-2c4dbd44110mr8726462a91.45.1718638673813; Mon, 17 Jun 2024
 08:37:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Edward Wawrzynski <ewawrzynski16@gmail.com>
Date: Mon, 17 Jun 2024 11:37:43 -0400
Message-ID: <CABRw72orHLEqpAS=cW1ThGkVUW0juqc7Y_-N2=o-k0rSqgpLxA@mail.gmail.com>
Subject: Xinput Controllers No Longer Working
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Good Morning,

I was reaching out to report that there's been a regression in the
latest stable 6.9.4 kernel. I'm using Fedora 40 and 6.9.4 just got
pushed to the repos recently. Upon updating, my wired USB Xinput
controllers no longer get detected.

I've tried two 8BitDo controllers, the one being the 8BitDo Pro 2
Bluetooth (with a USB cable) and the other being the 8BitDo Pro 2
Wired Controller for Xbox. Neither of them are being detected on
Kernel 6.9.4, despite previously working throughout the lifetime of
Fedora 40's 6.8.x kernel versions, the latest being 6.8.11. I've also
tried the vanilla kernel, as well as the latest vanilla mainline
kernel from Fedora's COPR: 6.10.0-0.rc4.337.vanilla.fc40.x86_64.

To reproduce, simply load Kernel 6.9.4+ and plug a USB controller in
with XInput (either an Xbox controller or something else that emulates
one). It won't be detected. I plugged in a PS5 controller and it
worked, but when I plugged in an Xbox Series S controller, it didn't
work. The 8BitDo Pro 2 Bluetooth controller has four different
settings (Switch, Android, DirectInput, Xinput), and it was detected
and worked on every setting except for the Xinput setting. Reverting
to version 6.8.11 fixes the issues immediately.

-- 

Respectfully,

Edward Wawrzynski
