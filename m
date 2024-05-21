Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B569014883E
	for <regressions@lists.linux.dev>; Tue, 21 May 2024 19:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716319612; cv=none; b=A0LR1iWX2225zTRZkes2T+y2+pB5Wm/jq4M5R+aOm1NqFE/bXRoScphzfHkz06hF36vEHjBl1mhztgMovo9L+yNHf9aXJAxlPaOqvdsac78Vyo816OtPLiBDs0/z3P9NT2QnmHvgHg2h9kz83KW0d4+ZX27yeVAgicmsPwAy6fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716319612; c=relaxed/simple;
	bh=PG0Bhj9TcLH+RIGS1FPI6Y6OS2OqHxgW6MGecFCprms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6yKfkmGaIthvUcn4F5nW5BaG5ZygEwti3Y3dmZoo3ASVjv4pvdyK0OzqQU85XD4mT4x4/Cmf7yE6CJRUAWFUNHas9Z8gvvhwSIq54CPKqugu8ITsrQmBgCDhApnAZ4KWfvMOIfkIy8AXfLJuXUvgFUyYAcpET5iA26jGxk0V0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eNvDlMu1; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eNvDlMu1"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51f0f6b613dso7427797e87.1
        for <regressions@lists.linux.dev>; Tue, 21 May 2024 12:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716319605; x=1716924405; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MD5xNertqR2g+hN0eAyKVzqg+xc07skQNSSjJdiq7WQ=;
        b=eNvDlMu1fl5oeoG2iMhjHGjjHIZqj7jmDHWfeGdU03UAey85q91i4zj11HmmlESyj2
         6XOMqt7WFWnKIyz/nhQQ9OPmfiWkjJaISPyCbVTtgP0A2LVUWNot2mdZbTWVRL0VL1cY
         K2eqGc/9+ha2vPYMZywViqtu7PfZ6gZ4s9AMDeaR2i7keRqgFqJlSaiK6Bv5IwhWXOMT
         PbKPOcN7jrBsetmt5rBIX2aFBLrR60BqkW79YCcRjAPns18g2h+Q+5i+2SYXNV3A4+tb
         LcyNq3W+3YCusfpxzUHmfb/xRDv3GDYW38yrdLQhJE5CtfsSLt6CG8JVYaFsdxqMRuRQ
         En1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716319605; x=1716924405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MD5xNertqR2g+hN0eAyKVzqg+xc07skQNSSjJdiq7WQ=;
        b=hIN0xFeZI5LbEy20k6DdYF5Rl0lzEYWuJTkjOpBqmbKLb6gd9dfaWIaee9SLXJ575P
         /rLEFphLwxBhF4BEtnRtpwuFKvKx5ylkNOO6jfOcf56/Wz/naPZ+qYavex/dl62AJlqw
         dWxPOJ5y0yU1kCQPWPyYzMPoXnBeU59DIi86sqwGjt1ZV3ixYDQvOIEbJ8TPlZPkCbDf
         08w/EMmGcWPAwiJ3JG99+3lfwaXAMZ75u4XlVx4Rj3rgZNMOnxOUV4X+srd+p34Fcmnb
         ziP54HCIofZ7YoeYSW4UQhFUxXtLnwHeTSvwPDRw7PYCTZylVJdHFgthTJXmRnoyb2W8
         LPyg==
X-Forwarded-Encrypted: i=1; AJvYcCUVbC9l8QXvUPFEjEFHbmILIsfzyjeswm4KxUEdWD5o6FuYAw/sNWXlZAss1Eq2b9pi7op3iBhaPawBY0ooy7hOtTiRjknQHWHl0xY=
X-Gm-Message-State: AOJu0Yzwi4uDOBgOL3bu2e6d3jmYQg3KvWEv2ISvuQpvnRDPtqnDj204
	B8Y9Ftwt0w6qWD23V7Yk8sm+IeZQl0OPqciQmNueTlEceyPfx9XjKj/v4oVCXD4bJHKG8SAnMmK
	3
X-Google-Smtp-Source: AGHT+IEI7yg/NIK80VlgHgC5if0nzTCUSeh26mIUJJHjHzauPok3eKyNNCTC5GQNcMDPLnXS2NGD9w==
X-Received: by 2002:a05:6512:1086:b0:51c:d528:c333 with SMTP id 2adb3069b0e04-5220fc7d748mr25123725e87.20.1716319604792;
        Tue, 21 May 2024 12:26:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d3791sm4734603e87.174.2024.05.21.12.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 12:26:44 -0700 (PDT)
Date: Tue, 21 May 2024 22:26:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Zijun Hu <quic_zijuhu@quicinc.com>
Cc: luiz.dentz@gmail.com, luiz.von.dentz@intel.com, marcel@holtmann.org,
	linux-bluetooth@vger.kernel.org, wt@penguintechs.org,
	regressions@lists.linux.dev, pmenzel@molgen.mpg.de,
	krzysztof.kozlowski@linaro.org, lk_sii@163.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] Bluetooth: qca: Fix BT enable failure again for
 QCA6390 after warm reboot
Message-ID: <Zkz1cppeCsKRrqQR@eriador.lumag.spb.ru>
References: <1715866294-1549-1-git-send-email-quic_zijuhu@quicinc.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1715866294-1549-1-git-send-email-quic_zijuhu@quicinc.com>

On Thu, May 16, 2024 at 09:31:34PM +0800, Zijun Hu wrote:
> Commit 272970be3dab ("Bluetooth: hci_qca: Fix driver shutdown on closed
> serdev") will cause below regression issue:
> 
> BT can't be enabled after below steps:
> cold boot -> enable BT -> disable BT -> warm reboot -> BT enable failure
> if property enable-gpios is not configured within DT|ACPI for QCA6390.

Please provide a trace or a detailed description and analysis, why it is
failing in such a case. Just claiming that it doesn't work or regresses
doesn't help us to understand whether the fix is correct or not. E.g.
the message - expected response - the actual response.

Next. I can only consider it to be hardware bug if there is no sensible
way to reset the BT controller. What if the running OS crashes with the
BT being enabled? Resetting the controller should be done at the powerup
time, if it fails to respond correctly. Which might include sending the
magic command. There is little point in resetting it at the shutdown
time just for the sake of the next boot.

> The commit is to fix a use-after-free issue within qca_serdev_shutdown()
> by adding condition to avoid the serdev is flushed or wrote after closed
> but also introduces this regression issue regarding above steps since the
> VSC is not sent to reset controller during warm reboot.

Is this commit already merged or not? If it is, then the tense is
incorrect. It introduced the regression. My first impression (as of the
non-native speaker) was to consider that this patch introduces a
regression, which left me puzzled for quite a while.

> Fixed by sending the VSC to reset controller within qca_serdev_shutdown()
> once BT was ever enabled, and the use-after-free issue is also fixed by
> this change since the serdev is still opened before it is flushed or wrote.

Please see Documentation/process/submitting-patches.txt for a suggested
language.


> Verified by the reported machine Dell XPS 13 9310 laptop over below two
> kernel commits:
> commit e00fc2700a3f ("Bluetooth: btusb: Fix triggering coredump
> implementation for QCA") of bluetooth-next tree.
> commit b23d98d46d28 ("Bluetooth: btusb: Fix triggering coredump
> implementation for QCA") of linus mainline tree.

I couldn't parse this phrase. Not to mention that only one of these
commits is a part of the Linus's tree. Maybe you had some other commit
in mind?

> Fixes: 272970be3dab ("Bluetooth: hci_qca: Fix driver shutdown on closed serdev")
> Cc: stable@vger.kernel.org
> Reported-by: Wren Turkal <wt@penguintechs.org>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218726
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> Tested-by: Wren Turkal <wt@penguintechs.org>
> ---
> V1 -> V2: Add comments and more commit messages
> 
> V1 discussion link:
> https://lore.kernel.org/linux-bluetooth/d553edef-c1a4-4d52-a892-715549d31ebe@163.com/T/#t
> 
>  drivers/bluetooth/hci_qca.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 0c9c9ee56592..9a0bc86f9aac 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -2450,15 +2450,27 @@ static void qca_serdev_shutdown(struct device *dev)
>  	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
>  	struct hci_uart *hu = &qcadev->serdev_hu;
>  	struct hci_dev *hdev = hu->hdev;
> -	struct qca_data *qca = hu->priv;
>  	const u8 ibs_wake_cmd[] = { 0xFD };
>  	const u8 edl_reset_soc_cmd[] = { 0x01, 0x00, 0xFC, 0x01, 0x05 };
>  
>  	if (qcadev->btsoc_type == QCA_QCA6390) {
> -		if (test_bit(QCA_BT_OFF, &qca->flags) ||
> -		    !test_bit(HCI_RUNNING, &hdev->flags))
> +		/* The purpose of sending the VSC is to reset SOC into a initial
> +		 * state and the state will ensure next hdev->setup() success.
> +		 * if HCI_QUIRK_NON_PERSISTENT_SETUP is set, it means that
> +		 * hdev->setup() can do its job regardless of SoC state, so
> +		 * don't need to send the VSC.

As I wrote earlier, sending anything on shutdown has a limited
usability. Send the commands on init instead and drop the shutdown
quirk, unless it is there to prevent BT from draining power while the
system is in shutdown state.

> +		 * if HCI_SETUP is set, it means that hdev->setup() was never
> +		 * invoked and the SOC is already in the initial state, so
> +		 * don't also need to send the VSC.
> +		 */
> +		if (test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks) ||
> +		    hci_dev_test_flag(hdev, HCI_SETUP))
>  			return;
>  
> +		/* The serdev must be in open state when conrol logic arrives
> +		 * here, so also fix the use-after-free issue caused by that
> +		 * the serdev is flushed or wrote after it is closed.
> +		 */
>  		serdev_device_write_flush(serdev);
>  		ret = serdev_device_write_buf(serdev, ibs_wake_cmd,
>  					      sizeof(ibs_wake_cmd));
> -- 
> 2.7.4
> 

-- 
With best wishes
Dmitry
