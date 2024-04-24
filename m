Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576FC1598EF
	for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 10:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713954855; cv=none; b=IevzNhJxUu5aIW9m3zM5csIZIQYrp/YN6Xg4SjA1JLXUDMrUR0E+OcMiAc8gFAC8tAxCqXMBOTum32rJpnt/jnl9lW3W+aZ0lisMFFFFD05F+J4cTp9L8vvN4mzpVccmhha0/XQ0U8TUjrwUpJRyMRcNsmaglg1pVYTObz80PUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713954855; c=relaxed/simple;
	bh=QslWPthNCxNrHHURQlPTjTLCkTBnRmLIUXZux2KXX5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJDPfwdKjxnVW0+cFbMUv4A9djflWtn4RHSzmkdirLpNiemQDJ6Lfh+xU2YuZ+ptYa27cveI9f0UinV0VP5/2/V1LBWLl3MTzswN6yYNIn0uL0HLs+v6YthtC4sMvb/sDt7TAMC4ia49KSRZrtmy82nGH2ArlUQs/B5IfdlOUZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l/gEkmOY; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l/gEkmOY"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-617e6c873f3so72581257b3.2
        for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 03:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713954853; x=1714559653; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tWqpnhAkKxffabgFehcfygGKTeKUYkh6WO1uD3T9Cp0=;
        b=l/gEkmOY1hUepNpLaxOUVofW2SH39iLy3BfeXQK3YpvZ6enGqP1XT18UAVKv0w9H4v
         nTSHwirnmIzQmtdJkax4+FzpE7FQSuMNSlfvGzIXHDDS5l8RgiP04DQNQlYC0MV/BQII
         T++B/GMJuStaavVB3/T5sP7kRiRUSTAKX/qUKjvnFne6SqAck15Hm2t2wll01dNlZLBz
         +GwYJ5mO7LNKmiRdC0juHoXV2Ytu8Bj+GT0LxGBKXLpgkXMqm5z5bNXIN0QdbXJp7yo2
         6iiUM3dEvIMrLUkRxUvNYrcoLoiZnLiculc0BZ6xAl+0KrJTmWHna2pa3fIoQjGuXMjk
         1k4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713954853; x=1714559653;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tWqpnhAkKxffabgFehcfygGKTeKUYkh6WO1uD3T9Cp0=;
        b=id8ooGGM4QO++4ONBJTIRK//x44ZIt1phEy9mKMexfDNzDLQLFB33o0kurS7nT0YpE
         Fx5GNJmxCAUIUa3aPesVS3EiXNenuBkqTk2ms6lf68Lk2OTRKOEjWflyyFaUadehYfWN
         25h93FPd2kyctSrOcJEhvKnNO7NZ8mR60fghrgfzdDADqc+8fGVHG/dhjTCu2lc4VhFc
         R3pNjtCgiJol9t8zfMqQ5w/wnARU4i3ZXaSNRSXtzf0KGpGCc9MO90wasVfVIylLAID6
         IS7umYYlHkYd03NS4HTZCxid+kkzYbT+qaiNYgiZtfNzwTn4JC6QsCQ9XTm0zhlj9R6L
         59bg==
X-Forwarded-Encrypted: i=1; AJvYcCViuJSEXOS7V6jmuRGe5JwfqIXd5z3ZtWa8VZYiCwT+ZmcXoLK95OB0TLk/5b3j4F3bmFCmRRqN78ib9JUlbEMI+nh9IpZ6PM3Woac=
X-Gm-Message-State: AOJu0YyjKRpZxknFwpHWzUpK4b+so1+AT+Qe9zVK1dp+9zFIB3F1McGH
	GtyIG90NwT49c5gelF449nm2Wv3m8MneIiCWbtGsybWWI1I6iEWRb42kfBAJSq14wRW+uwmcFoO
	mIbiCJ9E9yQCaUwU1iAxVqllczEJ/qhhn5D8+2w==
X-Google-Smtp-Source: AGHT+IGX6jReH7/d4zAo1Y8CAQHvuYg0zyqNAoNVHWG33GgQNr0dsKF6RFxaw6zKGJSK1X1o21/AJTYsnGB7DyKV1CY=
X-Received: by 2002:a25:840b:0:b0:de5:5823:d5b3 with SMTP id
 u11-20020a25840b000000b00de55823d5b3mr2135853ybk.26.1713954853204; Wed, 24
 Apr 2024 03:34:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1713932807-19619-1-git-send-email-quic_zijuhu@quicinc.com>
 <1713932807-19619-2-git-send-email-quic_zijuhu@quicinc.com>
 <a8a7e3df-44c6-4fa6-a576-da384c02e9ac@linaro.org> <067db05d-56bc-4ca3-aef1-bc3bae47667c@quicinc.com>
 <c1fc9c28-25df-4d41-9ae6-c5d079ea805d@penguintechs.org> <0db77c30-5be2-41b5-adf0-fb4436b9107b@quicinc.com>
 <c9bf22a3-2549-4cf1-898e-8a9adcd2f0f6@penguintechs.org> <d77455b2-4fb9-4ffc-acf9-c24b5a0f4a45@quicinc.com>
 <b3d8e1de-3beb-46a2-817d-ee0fdd614b0a@quicinc.com>
In-Reply-To: <b3d8e1de-3beb-46a2-817d-ee0fdd614b0a@quicinc.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 24 Apr 2024 12:34:02 +0200
Message-ID: <CACMJSeugN49baZiBhTYhb5rUKNkBwu5sVfzWkiJgs0sv9x9VsA@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] Bluetooth: qca: Fix BT enable failure for QCA6390
To: quic_zijuhu <quic_zijuhu@quicinc.com>
Cc: Wren Turkal <wt@penguintechs.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, luiz.dentz@gmail.com, 
	luiz.von.dentz@intel.com, marcel@holtmann.org, 
	linux-bluetooth@vger.kernel.org, regressions@lists.linux.dev, 
	kernel@quicinc.com, gregkh@linuxfoundation.org, stable@vge.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Apr 2024 at 11:40, quic_zijuhu <quic_zijuhu@quicinc.com> wrote:
>
> On 4/24/2024 2:01 PM, quic_zijuhu wrote:
> > On 4/24/2024 1:49 PM, Wren Turkal wrote:
> >> On 4/23/24 10:46 PM, quic_zijuhu wrote:
> >>> On 4/24/2024 1:37 PM, Wren Turkal wrote:
> >>>> On 4/23/24 10:02 PM, quic_zijuhu wrote:
> >>>>> On 4/24/2024 12:30 PM, Krzysztof Kozlowski wrote:
> >>>>>> On 24/04/2024 06:26, Zijun Hu wrote:
> >>>>>>> Commit 56d074d26c58 ("Bluetooth: hci_qca: don't use IS_ERR_OR_NULL()
> >>>>>>> with gpiod_get_optional()") will cause below serious regression
> >>>>>>> issue:
> >>>>>>>
> >>>>>>> BT can't be enabled any more after below steps:
> >>>>>>> cold boot -> enable BT -> disable BT -> BT enable failure
> >>>>>>> if property enable-gpios is not configured within DT|ACPI for
> >>>>>>> QCA6390.
> >>>>>>>
> >>>>>>> The commit wrongly changes flag @power_ctrl_enabled set logic for
> >>>>>>> this
> >>>>>>> case as shown by its below code applet and causes this serious issue.
> >>>>>>> qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
> >>>>>>>                                                  GPIOD_OUT_LOW);
> >>>>>>> - if (IS_ERR_OR_NULL(qcadev->bt_en)) {
> >>>>>>> + if (IS_ERR(qcadev->bt_en)) {
> >>>>>>>         dev_warn(&serdev->dev, "failed to acquire enable gpio\n");
> >>>>>>>      power_ctrl_enabled = false;
> >>>>>>>     }
> >>>>>>>
> >>>>>>> Fixed by reverting the mentioned commit for QCA6390.
> >>>>>>>
> >>>>>>> Fixes: 56d074d26c58 ("Bluetooth: hci_qca: don't use IS_ERR_OR_NULL()
> >>>>>>> with gpiod_get_optional()")
> >>>>>>> Cc: stable@vge.kernel.org
> >>>>>>> Reported-by: Wren Turkal <wt@penguintechs.org>
> >>>>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=218726
> >>>>>>> Link:
> >>>>>>> https://lore.kernel.org/linux-bluetooth/ea20bb9b-6b60-47fc-ae42-5eed918ad7b4@quicinc.com/T/#m73d6a71d2f454bb03588c66f3ef7912274d37c6f
> >>>>>>> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> >>>>>>> Tested-by: Wren Turkal <wt@penguintechs.org>
> >>>>>>> ---
> >>>>>>> Changes:
> >>>>>>> V6 -> V7: Add stable tag
> >>>>>>
> >>>>>> Stop sending multiple pathchsets per day. I already asked you to first
> >>>>>> finish discussion and then send new version. You again start sending
> >>>>>> something while previous discussion is going.
> >>>>>> you concern is wrong and i am sure it don't block me sending new patch
> >>>>> sets to solve other issue. so i send this v7.
> >>>>>
> >>>>> i have give reply for Bartosz' patch.
> >>>>>
> >>>>> i hop you as DTS expert to notice my concern about DTS in the reply.
> >>>>
> >>>> Are you saying here (1) that you identified a problem in the DTs that
> >>>> you hope Krzysztof notices or (2) that you want Krzysztof to notice how
> >>>> your description of way that DT declares the gpio as required affects
> >>>> your proposed change. As a native American English speaker, I am finding
> >>>> your text hard to follow.
> >>>>
> >>> 1) is my purpose. i have given my concern about DTS for Bartosz' patch
> >>> and hope DTS expert notice the concern.
> >>>
> >>> my change don't have any such concern about DTS usage. that is why i
> >>> changed my fix from original reverting the whole wrong commit to now
> >>> focusing on QCA6390.
> >>
> >> Let me try to parse this. If #1 is the correct interpretation, does that
> >> mean that the DTs are wrong and need to be changed? Do you expect K to
> >> do that since he's the "DTS expert"?
> >>
> > for your 1) question, NO
> > for your 2) question, need DTS expert notice or suggest how to handle
> > case that a DTS property is marked as required but not be configed by user.
> >
> >>>> I think you are saying #2.
> >>>>
> >>>> I just want to make sure I am following the discussion here.
> >>>>
> >>>> wt
> >>>
> >>
> >
> Hi Krzysztof, bartosz.
>
> do you have any concern for this patch serials?
>

Yes, we have voiced a number of concerns. Please see the fifty
previous emails in several chaotic threads.

I will stop responding to you now, at least for some time. I
understand that there's a regression. I will work with Wren to address
it. Hopefully we can get it fixed soon. However I feel like I'm
wasting my time trying to get to you and I have more things on my
plate right now.

Thanks,
Bartosz
