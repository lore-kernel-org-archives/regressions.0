Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B419137776
	for <regressions@lists.linux.dev>; Wed, 25 Sep 2024 09:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727257564; cv=none; b=BGtkSKAMXwrjxCh7FgI8dtfEUIFTUhjD98+eYzHrPhSX6md3/ynJwifs0JqFqFHyQ3fhHyCrvnhPKgtVbot2wmJ94lXMIMs/3DQOX3bx+DgPc25ZQRV2WXNR5h9nU4hWoIvM2I2FePBXUuU2LR42B5zRoqnOPIfg56VnbNryaM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727257564; c=relaxed/simple;
	bh=NgD5S9pyeEL0whX5CofWYtse3Eype5qITL1jwQePx/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+AIXD8F9nX0csDQdDPoX3tUI4mxfySZOtJy4g14KNKvYee6TsQy5fVYl6F4Ez4FpnmtVRteizQyRk+v/FzSjM0d33s3Ms14X4cgsS739h8m/8HQykg1NkZGhkA0boaY+M3f6rLaSyaFljJA4WJagldEFxGmz/lEc/2GPec/yzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Qpn910rp; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Qpn910rp"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53654e2ed93so7734897e87.0
        for <regressions@lists.linux.dev>; Wed, 25 Sep 2024 02:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727257561; x=1727862361; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgD5S9pyeEL0whX5CofWYtse3Eype5qITL1jwQePx/4=;
        b=Qpn910rpycyCLgxvVvDaH6Fos8wmrXfOU4ceWDRM52Iv0b1ouMtFfN4ix9FNKQF4Li
         sz3iGDsoW4phbhsMWQMC7MmYw8+WVywmciH4OpzfXsZOOtTuqKy7W/K7hSUv5OAhYUAj
         8vaDwvZRCkNzjsp1wZ91R8Mx9WcRF1ERWUN9JrjlGhz7C9mOgCBbzLESlJbcbKAFxK+U
         ta9xyyYB4Vw6YtxhZnq7k/nFxGvEjbChkzWK9QbZlKTVU98LLwj5B0h2v04yAKGN9s2/
         bpOBOCk4x+6iZNzzwb0FXw7VB1MRkYJkGwCxopf677sUmdG9yzpmfohWg2/YGRtwaRpC
         1wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727257561; x=1727862361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NgD5S9pyeEL0whX5CofWYtse3Eype5qITL1jwQePx/4=;
        b=stqtktD/KBZo+iQUSCEusXNcuNCA9lLn/mbkL0TnqtXWHX7nY+uFCB5N6CLicCd/WO
         uuHJ7g69hjqnXmmv2xW9K8YH6j6k+zUfcUbqPA5lvLmZl/XmyaJUZVrEPBTbFlSHL7EH
         2M3J9aEr3kOx0J6FH+47gZb0+iGifxyExTLo9ZvXi0psc9zs4icFN+1ARFWgqor+wj4d
         oFogcBSl2JEKG7ixtRL/ywJzgA9CGrJbAHYB1QocB+MiHNpCZ+xtjImdBSIpEN9H4YQ4
         k38l4HJ11WGhIHgUEY3UfznTXeE7XOOT3vpaFo5JtNmugBr8rc8lTuKJuv+WCmqUxzMv
         VXEA==
X-Gm-Message-State: AOJu0YxFYSYf/vNmyBOp7KViKqG6B15fJ/KIKf6UwM1Vj87Up2jkXlYj
	NJRh1rLDHwtbw14MedJjUPgK0+XHCKNaoEdNTk4bRxTxRKvojNA0X94whV42lxBrasLbhhuPryW
	HACCfucqGgRQuihiKZkkBUkrbrMOOlhTNDwN6rsSicbpKldWz
X-Google-Smtp-Source: AGHT+IGpIsWwcArxaXl2nN/jmHZ9mZk4PS6iOVoWxDnyGMawf9jGJkP8UCfY9YHJq1XUYoIoHK/PxmvoTaQAXkJyg9w=
X-Received: by 2002:a05:6512:1384:b0:535:3c94:70c2 with SMTP id
 2adb3069b0e04-538704979e7mr1306012e87.19.1727257560704; Wed, 25 Sep 2024
 02:46:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240911-tzmem-null-ptr-v2-0-7c61b1a1b463@linaro.org> <e1089f44-5415-4a46-a8fb-9711f122a6bd@leemhuis.info>
In-Reply-To: <e1089f44-5415-4a46-a8fb-9711f122a6bd@leemhuis.info>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Sep 2024 11:45:49 +0200
Message-ID: <CAMRc=MdmZ7_oHv_7Ja9E0pfuoF5wWeGz_1=Yq=G-gE_cpsBGSA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] firmware: qcom: scm: fix SMC calls on ARM32
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Andrew Halaney <ahalaney@redhat.com>, Elliot Berman <quic_eberman@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rudraksha Gupta <guptarud@gmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 11:35=E2=80=AFAM Linux regression tracking (Thorste=
n
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 11.09.24 11:07, Bartosz Golaszewski wrote:
> > The new TZ Mem allocator assumes the SCM driver is always probed which
> > apparently isn't the case on older platforms. Add a proper workaround.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> > Changes in v2:
> > - use likely() for the more likely branch in smc_args_free()
> > - Link to v1: https://lore.kernel.org/r/20240909-tzmem-null-ptr-v1-0-96=
526c421bac@linaro.org
>
> Thx for working on this. This afaics is fixing a regression from the
> 6.11 cycle; we already missed fixing this for 6.11[1], but please allow
> me to ask: is that something that bothers many people and thus should
> maybe be fixed rather sooner than later? No pressure, just wondering, as
> it seems the review is making slow progress.
>
> Ciao, Thorsten
>

Bjorn should pick up patch 1/2 from this series into the QCom branch.
If it doesn't happen by the end of the merge window, I'll resend it
separately on Monday.

Bart
