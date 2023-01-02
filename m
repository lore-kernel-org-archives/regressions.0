Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECE85667
	for <regressions@lists.linux.dev>; Mon,  2 Jan 2023 17:29:50 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-14fb3809eaeso28284896fac.1
        for <regressions@lists.linux.dev>; Mon, 02 Jan 2023 09:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ralston.id.au; s=google;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MO3PF6p+afXm5zn13bWM83e/wB85pg2FekVhsPuYcGs=;
        b=pkJ6DHVo7HHwKQEtGFFNvfZ9sHymqGr4Bj+Gz8KCtTeq280xzPfMNzP0OevL3ZUcJ/
         pJePiusWU12+zVf8ThBOP8EyZcrB5A6kryr+iE1DHm53vL5jZ8cRvOcCB0QaZWrySe91
         DX0C2/NkNieipZxOw0AfWPZHuCLqAFxT9oK5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MO3PF6p+afXm5zn13bWM83e/wB85pg2FekVhsPuYcGs=;
        b=nwEPf7/q4vOSE603w7IATZcOjLfk6FJsdr0Ifx7APUDLK2Dx50sEazAae+DJAdNTAb
         o8czHmpuAfWn+1BVZLsKmt0xv4tFhpcYmfBAdRkQgHONRxAW/ugP2C1Lhr/McEVAQW03
         87OsoZC3bGab6+z3m/9mRVs6Qovg9IITc5aJcEsRFaznlHF/mzWK97X+snTgc42ia7M3
         W+2+cxd2k55slCWfj8nh/fW04Tz0RN4YVhsLMwt3/XQqcwJ4MddnCzhvtC/KLGAMJOks
         dVJTsd/XR/CEA2DdKmkRNC7V2UCjD3rBveaUqxAb+L4DdCqQ+YR6qIw0NRqBjg3dcXQ7
         Y6Xg==
X-Gm-Message-State: AFqh2kpQBfVmCzsSAwsFBwFEgnJiWzCr5xd0oG+uzspDkkW318XUJjBV
	nANzCCuPmF5lWWIiXww3De5h2Ap+NulyII7R65WmGg==
X-Google-Smtp-Source: AMrXdXvyO8uVbMPjy4iw+DDTHcdUfmkOnyofYofSpArK6026+iSlt2535pEyIlkwhrLzSC/0boyvrHeOm2rfLYU88QY=
X-Received: by 2002:a05:6870:8dcf:b0:150:a904:9f9a with SMTP id
 lq15-20020a0568708dcf00b00150a9049f9amr414910oab.235.1672680589778; Mon, 02
 Jan 2023 09:29:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Michael Ralston <michael@ralston.id.au>
Date: Tue, 3 Jan 2023 04:29:13 +1100
Message-ID: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
Subject: USB-Audio regression on behringer UMC404HD
To: alsa-devel@alsa-project.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm currently experiencing a regression with the audio on my Behringer
U-Phoria UMC404HD.

Alsa info is at:
http://alsa-project.org/db/?f=3Df453b8cd0248fb5fdfa38e1b770e774102f66135

I get no audio in or out for this device with kernel versions 6.1.1 and 6.1=
.2.

The versions I have tried that work correctly include 5.15.86 LTS,
5.19.12, and 6.0.13=E2=80=9316.

When I run this on 6.1.1, it will just hang until I ctrl+c:
aplay -D plughw:1,0 /usr/share/sounds/alsa/Front_Center.wav

I've run strace on that command, and its output is at:
https://pastebin.com/WaxJpTMe

Nothing out of the ordinary occurs when aplay is run, according to the
kernel logs.

Please let me know how I can provide additional debugging information
if necessary.

Thanks
Michael
