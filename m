Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1115F53373
	for <regressions@lists.linux.dev>; Mon, 22 Apr 2024 08:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713775897; cv=none; b=DAB6SaDVh0tvXpd/S7UedLrP1WPM3DKMwgKFJvuENJUxD20ff42hWuMhjivfmBND2IecXMuLlpk49Lxu5Sz+fWXk2jYjaGkrWgcbpI8QuJJE8bpTuf9i+A51zvKCScDKqhqiMyCKA0eeexU9ECPHk0S7YmZgeLOVOW1CdHgyC3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713775897; c=relaxed/simple;
	bh=aaWJhrxHefW6OYM1Lm42mdnzIMmKYx7z/3WTEesws2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZmrNr1B5kCJl/qVNMxOcHHAyyJqVquZxNn/2mhmczd2Obf7Pew9JV6YOaPYm2E0j9gFlhejV+ohj09xwVWXdwAJaBW1Wgqr7oDtC1vBs0wRdRzwnB40aMFzVKTpb60CRVGDCVmjVkAgdak4mg2gjjR7cOgNwEDR8j+YhlyXt14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qlLQ+QU3; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qlLQ+QU3"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-de466c64161so4319087276.3
        for <regressions@lists.linux.dev>; Mon, 22 Apr 2024 01:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713775895; x=1714380695; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aaWJhrxHefW6OYM1Lm42mdnzIMmKYx7z/3WTEesws2M=;
        b=qlLQ+QU36u4OhlSz5MXXH5UzOfA+0etDxSkY1lLYRYFSIIyWcKe5yKkCFWzLvJ4KaR
         qUTMei48JbW5xHP3QhMdfjfu/Bmb8Pa2bCi3GXrPshmNt7cH+p1pBqesLtNLINlApBGV
         RGS/G4+mO6aTa4B+1l2Tr6oDnJSc0NSq4uLtszsjuEwnRfyTCKF1aQBRymLqEp7A6zig
         jFgHCZi9hIMFD97EiBjg6ClF9hscYwaFQz4OkwCgMrcogEN1W04tkbPeV4HM1CrbB0mb
         LgJD/F17/RimDBUZ6pWLIwd7/bha0xl78I4WDW3/SzoJIOyn2eCtG73OTSSiurrU7rGI
         QoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713775895; x=1714380695;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaWJhrxHefW6OYM1Lm42mdnzIMmKYx7z/3WTEesws2M=;
        b=RL7t85yDLJb1MfOtiHXfoo3bBv9emzzYQBMPtUXACDNlzfuRS5kwRoiSwVZaAXV36W
         ucYR32V5zIsAHtI+q+5EJExvLY+eENmv0rFCVMFLY2huU5iANzr8unoGn0jThRCLYh8A
         1OpR4qNaKetOA2Sx+wDcMqw3BsSiAOO44uH4kL63eAUz+KMayDSLA8N3ofEiLz9z26Ux
         b3xOLPTQk+sTG+gpyndjgP84RtMhwUNj7+i4/kTujXhX+Pw06n0HgHmZVrMpMDJ4RacP
         WtEkocrvooeYefZib2eKTIu6s9lkucdOvkNAvSwY46kbJAhQOMX29rtG0djCQQqhxWTL
         Elfg==
X-Forwarded-Encrypted: i=1; AJvYcCW4F6fGW+Omp3NGMJW3eRH9V3Gd5mtbaIwMTaokeZDnUZWymTCSxrYOLtAiMu5Bqau+otQZ1EafOFLvmqGGBfybP8DV7yBUA4NaRfs=
X-Gm-Message-State: AOJu0YwQc6kQNmzDBTTE4Ttjq5jjaJt+gIMoPAYAIZVIxATKyPg9reBC
	nklIjoUThareL+frMCdffjOcPROTIslk8LtHLqjsEPuEO8YKK6uXUCBYfXb5h7xpe9h2gPG5DR7
	2QnztKP93k5QfCBg8UqMS8ed1E3qEwYneSS1fEA==
X-Google-Smtp-Source: AGHT+IGa0GuupdMNJ1epjmn8Wpx5q6rHYjGPtTWalVI0uAb5KutY6EIOzU4z2zWEvfy1Zqj7s2LYy4MLxWJI1kqtXsk=
X-Received: by 2002:a25:86ca:0:b0:dc6:52ec:7ff8 with SMTP id
 y10-20020a2586ca000000b00dc652ec7ff8mr9108028ybm.4.1713775895134; Mon, 22 Apr
 2024 01:51:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1713564212-21725-1-git-send-email-quic_zijuhu@quicinc.com>
 <1713650800-29741-1-git-send-email-quic_zijuhu@quicinc.com>
 <369512e2-f091-4370-bce5-9ac32178dc4d@penguintechs.org> <a6ae69ad-b602-4cfc-9f76-8932f357d30b@kernel.org>
 <c0f7036d-c129-400b-85a2-1414ec3d2622@quicinc.com> <dc17aea1-9399-4c2b-8775-fa0a7f602035@penguintechs.org>
In-Reply-To: <dc17aea1-9399-4c2b-8775-fa0a7f602035@penguintechs.org>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 22 Apr 2024 10:51:24 +0200
Message-ID: <CACMJSevocRot6J06uvridRw9MZFftJrkCyYBgXhLnwfapVPnCw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Fix two regression issues for QCA controllers
To: Wren Turkal <wt@penguintechs.org>
Cc: quic_zijuhu <quic_zijuhu@quicinc.com>, Krzysztof Kozlowski <krzk@kernel.org>, luiz.dentz@gmail.com, 
	luiz.von.dentz@intel.com, marcel@holtmann.org, 
	linux-bluetooth@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Apr 2024 at 07:21, Wren Turkal <wt@penguintechs.org> wrote:
>
> As the user who originally reported thes issue, I can confirm this. I
> was introduced to this regression because I use Fedora Rawhide on my
> laptop, which builds and pushes kernels based on mainline very regularly.
>

I don't doubt my patch could have caused a regression.

> Here is my description of the regression: After the reverted change, the
> BT hardware in my laptop (qca6390) will only work after a cold boot when
> the hardware has only be enabled once by the driver. Once the hardware
> is enabled, the process of disabling/re-enabling fails. Also, the
> hardware cannot be enabled after a warm boot of the laptop.
>
> Among other things, this makes logging into KDE Plasma break my
> bluetooth mouse. The cause of this breakage appears to be that Plasma
> disables/re-enables bluetooth hardware upon login.
>
> GNOME operates slightly less badly in that bluetooth stays enabled.
> However, if I manually disable the bluetooth via the ui or by restarting
> the bluetooth service with systemctl, the mouse fails in the same way as
> happens with Plasma.
>
> Once the bluetooth has failed, the only way to fix is a cold boot and
> only enable the hardware once. I cannot remove the modules (btqca,
> hci_uart, and bluetooth) and re-modprobe them to fix it. I can't restart
> the bluetooth service. I can't do both of those things. I haven't found
> any way to re-enable the hardware beyond cold boot with bluetooth
> service enabled.
>
> If I disable the bluetooth service and cold boot the laptop, there also
> appears to be some kind of race condition as not enabling bluetooth
> service very soon after loading the hci_uart and btqca modules during
> boot puts the system in a state where I can never enable bluetooth. I do
> not know what causes this specifically, but my theory is that not
> starting the bluetooth service immediately puts the driver in a similar
> state as when the service is started immediately. Maybe some kind of
> lazy initialization that is forced to happen more quickly when the
> bluetooth service is enabled?
>
> Any way, this reversion by itself (which I manually did after a
> discussion with Zijun before getting his test patches applying to my
> kernel for test). However, this reversion did not get the hardware
> working after a warm boot.
>

This all sounds plausible. However just reverting this patch is a
waste of time as checking IS_ERR_OR_NULL() on the return value of
gpiod_get_optional() and continuing on error is wrong as I explained
several times under Ziju's emails already. I provided a suggestion:
bail out on error returned from gpiod_get_optional() even if the
driver could technically continue in some cases. I don't want to have
to argue this anymore.

Bart
