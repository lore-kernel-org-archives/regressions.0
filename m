Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB641B90F
	for <regressions@lists.linux.dev>; Wed, 21 Jun 2023 19:51:48 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9887ebe16d0so552958966b.2
        for <regressions@lists.linux.dev>; Wed, 21 Jun 2023 12:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1687377107; x=1689969107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MfThIXnm1cC9qXQRV1CY6U1OcxuFqEAFC2ABjaKFNAI=;
        b=MbbG7drYmNXCj3A9IhR6yNxurZaP/pIafigCURw1KmcLwWww21MB04/4OGrS8fApZz
         W+4joZQzrYlG8KNcwvY4XDVPMikD6LgrlmKgli6qA5fba/EzxKOZmXaKsYpFGoAXAWGG
         lzZmroiCEhXJUDD7w/yEx4/CvnAN/tdljMims=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687377107; x=1689969107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfThIXnm1cC9qXQRV1CY6U1OcxuFqEAFC2ABjaKFNAI=;
        b=j/zRS3jGCwoTRKI1Dx5/baGDP4iIniXIhXadheoyeCiTwdPlAeOtz9zfCigrKnaDkH
         yPatgtC6dTVOooOq9+JnWxp8Cvnpauki6EN6i7YKmAeeO/BfVXMdXJvXtM0AzK7M8eRe
         8xr3qOReXA5oENTAGzc5ThsWcdr5H1k6ST/d3eXB8FrosbbqKn37kRXGVW13sS3mgFIm
         2SJEWhE3gEWWH+tsuXhOilo3M4ipdjIR6JabeXt+lv9eswJyUvkIhMDv8Zm4tjQ589jY
         NvVmrbN9rPPnyCs28ENZ1T4bPOqi5qmC1lLBT0pdwrh/6Ux6DHMDaBEqQS0zPDgbh5DU
         YMcg==
X-Gm-Message-State: AC+VfDx7C7l3nI/egPScYhTgqwpGsC5aDGDL8kFQJ4jkzC4OWFeKQjCb
	hOTlXL6Uh1YDJhdEM1+LyZ+4e9VkPUxdRf4Ruh2LE8UG
X-Google-Smtp-Source: ACHHUZ75bsGHxmBS9wJYiiXN1AKW17dcg6+WxM46A/VuVNT24PhqYSvlCFAy++VPjg/HfejD6TNwMg==
X-Received: by 2002:a17:907:6d97:b0:988:6193:29d2 with SMTP id sb23-20020a1709076d9700b00988619329d2mr10777617ejc.13.1687377107053;
        Wed, 21 Jun 2023 12:51:47 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id lu4-20020a170906fac400b009889c4bd8absm3559806ejb.216.2023.06.21.12.51.46
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 12:51:46 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-51a3e6a952aso7537522a12.3
        for <regressions@lists.linux.dev>; Wed, 21 Jun 2023 12:51:46 -0700 (PDT)
X-Received: by 2002:a05:6402:111a:b0:514:a110:6bed with SMTP id
 u26-20020a056402111a00b00514a1106bedmr10689946edv.27.1687377105968; Wed, 21
 Jun 2023 12:51:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <GQUnKz2al3yke5mB2i1kp3SzNHjK8vi6KJEh7rnLrOQ24OrlljeCyeWveLW9pICEmB9Qc8PKdNt3w1t_g3-Uvxq1l8Wj67PpoMeWDoH8PKk=@proton.me>
 <ZHFaFosKY24-L7tQ@debian.me> <NVN-hJsvHwaHe6R-y6XIYJp0FV7sCavgMjobFnseULT1wjgkOFNXbGBGT5iVjCfbtU7dW5xy2hIDoq0ASeNaXhvSY-g2Df4aHWVIMQ2c3TQ=@proton.me>
 <ZIcmpcEsTLXFaO0f@debian.me> <oEbkgJ-ImLxBDZDUTnIAGFWrRVnwBss3FOlalTpwrz83xWgESC9pcvNKiAVp9BzFgqZ0V-NIwzBZ7icKD8ynuIi_ZMtGt7URu3ftcSt16u4=@proton.me>
 <e2ca75ef-d779-4bad-84a5-a9f262dbe213@lunn.ch> <FNzHwp9-AyweVwIMndmih6VuBD0nsyRp3OM72bmOxpeYszF680jFPJjENIknT32FeaqfVBtVSQFw-5mgE3ZXeksVD8VCFbxwojxP3mSZ9DQ=@proton.me>
 <9517bb70-426c-0296-b426-f5b4f075f7c8@leemhuis.info> <CAHmME9oh7kEUe-6NFk9=_8UxeD-SNbfMksYh3GaYdutXS01zOw@mail.gmail.com>
In-Reply-To: <CAHmME9oh7kEUe-6NFk9=_8UxeD-SNbfMksYh3GaYdutXS01zOw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 21 Jun 2023 12:51:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=who5-p3QKFnio2nA9b4yf0qrV-KZ8bJa7m80ouJbvOfoA@mail.gmail.com>
Message-ID: <CAHk-=who5-p3QKFnio2nA9b4yf0qrV-KZ8bJa7m80ouJbvOfoA@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Boot stall from merge tag 'net-next-6.2'
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Sami Korkalainen <sami.korkalainen@proton.me>, Andrew Lunn <andrew@lunn.ch>, 
	Linux Stable <stable@vger.kernel.org>, Linux Regressions <regressions@lists.linux.dev>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Brad Spengler <spender@grsecurity.net>, regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Jun 2023 at 11:49, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Would you try applying
> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=13bb06f8dd42071cb9a49f6e21099eea05d4b856
> instead of the revert?

That commit just got merged into my tree, and it fixes a real bug, but
it _shouldn't_ be what Sami sees.

The bug it fixes was only introduced in this merge window.

So any boot failures seen in older kernels would only be because it
was then backported to stable trees, but Sami mentions kernel versions
that don't have those stable backports (eg the original questionable
bisection that ended up on a bad commit 7e68dd7d07a2).

Now, with non-repeatable boot failures, anything is possible, and Sami
does mention 6.1.30 as good (implying that 6.1.31 might not be - and
that is when the backport happened).

So it's certainly worth checking out, but on the face of it, that
bisection result doesn't really support the bug being due to
e9523a0d81899 (which came *after* e7b813b32a42).

                Linus
