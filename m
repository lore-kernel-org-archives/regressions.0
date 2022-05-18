Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FBE469F
	for <regressions@lists.linux.dev>; Wed, 18 May 2022 05:55:21 +0000 (UTC)
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5057B3F20A
	for <regressions@lists.linux.dev>; Wed, 18 May 2022 05:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1652853312;
	bh=7QzVvRPT9zcHwwbvlE1BZS1PhfbxonREGh377KbSmmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=s/vOlIlCeC0dPlfn60Z1ajYuJhNf7Ds32AbnbUwDTrvxPnVuOb6BVIb+jKOgWvwTt
	 8jsN15XAFst0ZrVU6XMd9w1rn6WqfOKHkC16lXcGljN7vnKe0kX0p/c50RFofAvO1p
	 ZoI7bbWxlhWYFul7fTONu8mdYI0gk/yoTlMMT5qMmnMAoqLUf61f+uKoELuK4T+Seh
	 RMqEFm0SzOTCbHlT3bfPaQavj0VrqYORju8+eXTntCoBfl3jOChxWAFi/QdYgC+esX
	 UN9E/5nHLnKodXa9+VDRqPA7TYSWrmm0niAGjD+fDZdDU/EWamxu+HGiTt36uuxH2F
	 aNOk0HgTcHFQA==
Received: by mail-oo1-f69.google.com with SMTP id b8-20020a056820134800b0035f6e70c82cso662785oow.2
        for <regressions@lists.linux.dev>; Tue, 17 May 2022 22:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7QzVvRPT9zcHwwbvlE1BZS1PhfbxonREGh377KbSmmo=;
        b=742ObPmC6qrYQ02g+lNgrXqZHRVsT99BEP2QWOEINn9BSTtnHfG7xpC88lJWkujqtA
         l5/D8zysnsht0oM35Xp5aWc+XN1JWVBOw3B2JsRuf6PIliEs+v1jxZ4FfBB4EdUf8GVg
         aRgUyn5he6L5MxjDYwzcsm9R4LiWq6M2/kxekQdz32QFDa7pxFAJHTOiFoYB3cDHbgqL
         zgnIUMUVpCJJNgxlkvaqnMgWkf2v+UvAAp9r9ueHGf35ysWuj2liT2hUYHDtYtmamhUx
         Wuh/YTq+qYnWftMymxHAZPIGUZol7nXBy3K3GglegE+FCf3AAyYcDSPRER6DcDDLOQ3R
         pQvw==
X-Gm-Message-State: AOAM530aQx1xVLc8R8we0maWiJDeep7f3Ypc1VYYFMetDW1U4EFQ0vQp
	qML3x1s6tGJIbsFJraGeCDkR8rbwvheQjCIFvjY4DcRnxhc2Vy60tqWA9GZyQ62/dpjhMzGaym8
	hJQmOxzpYloFzRJGhFePorjgqFM8WeMLcRopIekN75pYNZZO+xjekMDgN
X-Received: by 2002:a05:6808:1441:b0:328:af9e:5540 with SMTP id x1-20020a056808144100b00328af9e5540mr12372828oiv.42.1652853311162;
        Tue, 17 May 2022 22:55:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVpJ1/BBEpcSQaygPxyD32x52i7qeqG7wwqzTjFQkpxGvWl5Z9noxcBBU53YMpGpzjNmG6aPHbXHWHVRb7gUo=
X-Received: by 2002:a05:6808:1441:b0:328:af9e:5540 with SMTP id
 x1-20020a056808144100b00328af9e5540mr12372824oiv.42.1652853310886; Tue, 17
 May 2022 22:55:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <941867856.547807110.1652809066335.JavaMail.root@zimbra40-e7.priv.proxad.net>
 <4c8afdd6-3573-619d-d46c-e13a4fdd9ac7@leemhuis.info>
In-Reply-To: <4c8afdd6-3573-619d-d46c-e13a4fdd9ac7@leemhuis.info>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 18 May 2022 13:54:59 +0800
Message-ID: <CAAd53p4ddFYE+O6Je8z9XDy54nTiODJsQEn7PncZ95K_PXPtPQ@mail.gmail.com>
Subject: Re: [REGRESSION] Laptop with Ryzen 4600H fails to resume video since
 5.17.4 (works 5.17.3)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: casteyde.christian@free.fr, stable@vger.kernel.org, 
	regressions@lists.linux.dev, alexander deucher <alexander.deucher@amd.com>, 
	gregkh@linuxfoundation.org, Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 18, 2022 at 1:52 PM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 17.05.22 19:37, casteyde.christian@free.fr wrote:
>
> > I've tryied to revert the offending commit on 5.18-rc7 (887f75cfd0da
> > ("drm/amdgpu: Ensure HDA function is suspended before ASIC reset"), and
> > the problem disappears so it's really this commit that breaks.
>
> In that case I'll update the regzbot status to make sure it's visible as
> regression introduced in the 5.18 cycle:
>
> #regzbot introduced: 887f75cfd0da
>
> BTW: obviously would be nice to get this fixed before 5.18 is released
> (which might already happen on Sunday), especially as the culprit
> apparently was already backported to stable, but I guess that won't be
> easy...
>
> Which made me wondering: is reverting the culprit temporarily in
> mainline (and reapplying it later with a fix) a option here?

It's too soon to call it's the culprit. The suspend on the system
doesn't work properly at the first place.

Kai-Heng

>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>
> P.S.: As the Linux kernel's regression tracker I deal with a lot of
> reports and sometimes miss something important when writing mails like
> this. If that's the case here, don't hesitate to tell me in a public
> reply, it's in everyone's interest to set the public record straight.
