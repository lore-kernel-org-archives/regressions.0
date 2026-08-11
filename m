Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E2C3BBA0E
	for <regressions@lists.linux.dev>; Tue, 11 Aug 2026 17:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786469128; cv=pass; b=urF9i+L1IRJjLkFNSaJL/GuPm3uvANsS8b+2EmdjqGJYx4YifED3+6bGvSJPP2I9NCbkJ+W63wAm9XZm9/4GaXklz1/6Olp+mlQyf0oK82flesTH2b445rMIRIQWIXQWotgzFRVh70J4zRwdo4ABYTlCGim9ND21/Nx0BSn7nPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786469128; c=relaxed/simple;
	bh=EKdDZrC9AJlrQYmnYkeOnBhcEnSUmfbTXjwDGQ4IKqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bPxy3zZ6S0pQa1xbb6ctKxwuGnGAC8Ho09PuKCain7jkebJb9sqL+O3T+auiDsnRDtvbOeOd72rYLW6MxuNOQZFUgyxMq4xOBfXxIjRr9b+cHe4QAw15lpTeo/5DceamCmBAgjRqPdX1EUvK6TlZrc6AHdLh84/LrRCXwQICXEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hb3bcA0z; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hb3bcA0z"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cb2513ec378so999a12.3
        for <regressions@lists.linux.dev>; Tue, 11 Aug 2026 10:25:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786469126; cv=none;
        d=google.com; s=arc-20260327;
        b=RuK4X8AeUFVvN9GNekTAykoYUDKjWRAHekhFlN++5l/bvcYxZFGLuPK0mGFlQXVKlV
         b5WNeSbJn9tKe1/N5xVJRvKW/tBee2MPd+UdiRM8DihX39+tjOSdTWxnHkOpdiWRWKa6
         SZCaBcJubdAyEjKH9alTgCE70XA0ulENyNgAmApaCllC9sGEWU7q66SKwhPNvc6Ono2c
         Gy8UeQVst1Br3vmm7TLBRPFyR7+rTzSiCaXHwOwUvXrIeqFikLxh+wkftZA1jq/J91Vl
         gem22JlWnjnqr3h2FewiBZwadpSMWlS9PhzHOs6y6K4OH1R22wWYshBA9mOL9Ie15eea
         skcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VnCf0z9Ked0EoU1PHfiMbSxVtjmvWOlMFbDKXa+KErw=;
        fh=Q4aulwYg7HXnsDBxhE3YJCXCVn0R42+j7S/ASQXxlyA=;
        b=s7ttXrnrBcEo5EhL6dXGqspI/mazifHu/3uDnnL5mzPoUxQ6NLUQgUePS8S65ppv3W
         xisCdaIvQ5/uN7RXos/J/gahZhcVqTaC+lDvTx+4ysgCMXSjUhOOHAQUSJ+loKJTftGu
         DBqXrW9a13dMiwb1Ed5Z8BruRbdDin/P7BFaitEeObJxF1h4g1wxait4iof91AKFYUIQ
         448aquZg09d3J59FEMB0PaaTHIqBzqKPRWfEPU57BgWoa8h7RB/BIShTjp5zSsM442aG
         uJvVutkm3DLJY8/slMhsFfwMNpvjJ8DTaHTHQNDNEgfu01fdK0gkkTdw60bmbbYJmsJO
         Af6w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786469126; x=1787073926; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VnCf0z9Ked0EoU1PHfiMbSxVtjmvWOlMFbDKXa+KErw=;
        b=hb3bcA0zipWjD0O4CFUuCsdeNmoRCTre6wTxLebv2qq03JwZ/U9V+Pel6dZ62xcNOQ
         +rrFN/zbs4qah8ten8SLUh97D5hdWnE+0gqzln5Nmk+/GstkrfMXLp2Fce89jTDYJ1jg
         yLY5UAmrKeBHVQf0LfFbZSOl18mlGFvrqMcqYgPmX+C4DGOUOUCywsuY6O3TH3lvwd9I
         ZqIXmhNWjzKVLGeA3ClN9URzH7q8fyhtMnFd/Iy2AkDf7nwjb1hOqjSw/jRBndhtauuX
         9fF54/jc9PWyWHrsq0FjP049p0ieJ02KDF4G9vEH9zlCos3ylj2fisQUJMvyvj7lp/qa
         gZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786469126; x=1787073926;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnCf0z9Ked0EoU1PHfiMbSxVtjmvWOlMFbDKXa+KErw=;
        b=UbvKKu+oVdbdDlVLL4NlJhROumhmfiXEgCQYJ1RkyNkhHeYNQue8GSPx+SwVDmcHHV
         WTo6vr5pXSpEGg9wDxQGg59TF16vNse2+Ri6PrMEEKmX9DoCTMVncuowSktLDXDlNu7k
         1wmqrf+NtnyRgyjE9BrwDi2qfx8AFMcEwNnxkGK+b/NKW0ZYzaV0yK9YMNPzZ4WUOT8y
         pQU1kz6GBPXDpdHDr1LYa4XYRWJn+MO+amzv1yKgk1ojZvFMbGVN1lrnrWTW95B9NliL
         w6uheiJ/95809lBMxYUIym2Eq3ggaqDAJ5d4Wuk9EjWt0T/MeIX9Ntr8M8HLZPRFaeUe
         E3Bg==
X-Forwarded-Encrypted: i=1; AHgh+RpDgJy/u/ByA13CkVGR6dzuOTkr50VqISBS3HlOAGca4ZNn7ZGXfxXyBybFtyM4jweDcY1/AHndgYJicw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywwpp+028eodo2n9UcGIt7gxrN8li9rFnSU/fLUpL6ES8r7XuJD
	FNGk2ztNGkyVlOeKJrWLHGPjFgLf/7FjRkERGfG52yrNqfFcVqlfJUW7RFGQDtTjuXxo5JFUDCT
	CmalmVLx1c+5LWewWjR2vrzagqIdCb/Q=
X-Gm-Gg: AR+sD11U9ftc591kdz1sFvQzgSXBGy/FRRFl15tDZh+daDxp9fktOOjOZMg+xTXhoQc
	YnuUUzub6Ytads5FQq1mIWq7QI76iMLkZ+acJ5oQ6iJykzRoS1gV7n6Dlmu/c3I0cwFuitriD7M
	Yf1HccP8EMmpzPHyaoyEs3aSbp1ImUSOQXFTWHbrhPC9x0PF/ous1/pJaMv79Y4u6pJ1nRO89+U
	a3cp4oz6UmdHCdtoFTPTqV/KXs+yM5W//13p3AfkgsSoBhckmXyrK9fdLpY8zSdZ9yrzfgjjgbA
	1LKOpge/qEDorA6lqTR1Rh+snL+bN4yQ7VjbiMoLnveoIWstg11hHjK4r8Oj2+WJ+ocUIMpfGim
	qP8MaaCYtj/AnPK9P3FDe6hKOHdCfIg==
X-Received: by 2002:a17:90a:ec87:b0:381:2788:a437 with SMTP id
 98e67ed59e1d1-392ec4d2710mr3743472a91.1.1786469125571; Tue, 11 Aug 2026
 10:25:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9c6acb62-4080-48e6-9ba2-d1c457c4ec88@gmail.com>
 <2026081106-pebbly-cahoots-37a7@gregkh> <23db5f95-c2d6-4712-856e-28f647e184f7@leemhuis.info>
 <1caea72e-b9c8-452b-a3ff-5690d948b4fc@gmail.com> <2026081151-reabsorb-calamari-7442@gregkh>
 <8a0fad2d-788a-403f-a880-2f97c6708275@gmail.com>
In-Reply-To: <8a0fad2d-788a-403f-a880-2f97c6708275@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 11 Aug 2026 13:25:14 -0400
X-Gm-Features: AUfX_mz9ctPsNNIvI5n7PNT1dVO_8-kv7BTU0GjEEq0Wv5KbQ8xlxsfBpZDT3qU
Message-ID: <CADnq5_Pb=ox3nWfdpb3Qeo_eSQayuc7UqUOnm0x+WS+EQTVWjA@mail.gmail.com>
Subject: Re: [REGRESSION] Please revert 1191285ecb42 from 7.1.y
To: Sergio Callegari <sergio.callegari@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, stable@vger.kernel.org, 
	Mario Limonciello <mario.limonciello@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	George Zhang <george.zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 11:25=E2=80=AFAM Sergio Callegari
<sergio.callegari@gmail.com> wrote:
>
> On 11/08/2026 10:08, Greg KH wrote:
> > We aim to be "bug compatible" with Linus's branch, otherwise the
> > "pressure" to fix those bugs goes down.  But I defer to the maintainers
> > of the code involved if it is being worked on, and they want it
> > reverted, great, we can do that.  Otherwise we prefer to leave it as-is=
.
>
> I understand. Sorry for asking about things that might be obvious to
> most people here. My expectation was that only a selected subset of the
> patches on the Linus' tree were to enter in stable, so do we really need
> to have stable "bug compatible" wrt this bug? The original behavior was
> not free of issues, but they were rather minor (a reporting issue). Now
> we have this very bad behavior where the display remains dark.
>
> To make the matter worse, on systems that have encrypted root the screen
> remains dark also on that password prompt (observed with plymouth).
>
> In any case, I managed testing 7.2.0RC7 and it is fine again.
>
> Looks like the Linus' tree has more changes wrt backlight, and the
> interesting ones are probably those in the cumulative fix
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D973fd9493ec21f12e760fbbedeb7b0b2317c02f4.
>

Thanks for testing.  It sounds like we should revert the change from
stable.  There must be some dependency we are missing in stable.

Alex

> Best,
>
> Sergio
>
>
