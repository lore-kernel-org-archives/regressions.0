Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDFF3FCF
	for <regressions@lists.linux.dev>; Thu, 16 Sep 2021 16:35:34 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id dw14so4958914pjb.1
        for <regressions@lists.linux.dev>; Thu, 16 Sep 2021 09:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gt+r7rB7pOJSQ7W9DGYo66pY6w1yXmUEGm3iewZagGs=;
        b=YOO6pC2z+QRaJL2FP1+cetlhoPONSQZg7eY2yLDK8roGPWbc9sigaVpjLo8GpopAEt
         6dpX5ls6QlvN8297Oc21azN16SHcgPDMJcitwRcy5ANGXg3bnVq3Rlc7QGoiwCwDQOsi
         JNRPNZabX30oyA2uOTy4d0YnMNkpTLESRpv498IMBHqFIS9ZtJLpLwMudRhZqv9+4ZyD
         W0F7vw7P+YsluTgr+ojS0mc5DXmGSLwQKhwpk7PYW4vV3cTbrCrXJqPWDxuqZYo6NQuv
         ZvsPwmplyQK4fMp5EMraC3ntygo3wZs+GpSUOYXxvIn4Nr1DmeIDAlH9qcIQ80FO7PCN
         l4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gt+r7rB7pOJSQ7W9DGYo66pY6w1yXmUEGm3iewZagGs=;
        b=HhS4W3ng7SGIImJ7FwK/+UsfuOMv8KAQTDpgYCb74kjCLL2SQL2GTLR0v4PaBkbbk6
         Tn70dzOS7Hkq2Z2iCAtPxFJhG50NhjngznDJ98HjwTnpRKMbnXyAiaM5J8hCvNm0byIm
         BONLcmCXJu6tLhMVo5yYO0rXrgaFahdGKaWNa6P8CTAUYR2zv3GicKb5YuJzsXP0YYQx
         BRGObx19MgY3dS5eE3dRLsS9JRxlRPD3E8I9f0rD92yP5lZNO5rB+KSCYmuh/p7qMO3a
         kxF3kcZ/wnACygKbXIc3IAKxHSl2IKPXEUCXJeGn1kGxT5J7wZoiVKtcOL8mDab5dJn1
         I8Ng==
X-Gm-Message-State: AOAM531QSphHZ2EHeGSQoNV/Kbp7V1iVa4LpKY/9y9kwFWfzqyMg1R6J
	HqIb8f9AcISrtKc92i8PqEyv
X-Google-Smtp-Source: ABdhPJwLv1/q2iNeC58++mRrmPhb6MJdsEz0qlcZ2ADeRpdVKbb2FXjiUMui5WtQU9sga1edO/Q9Vg==
X-Received: by 2002:a17:90a:ea8b:: with SMTP id h11mr7127110pjz.124.1631810134300;
        Thu, 16 Sep 2021 09:35:34 -0700 (PDT)
Received: from thinkpad ([117.193.213.12])
        by smtp.gmail.com with ESMTPSA id m28sm3751263pgl.9.2021.09.16.09.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 09:35:33 -0700 (PDT)
Date: Thu, 16 Sep 2021 22:05:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, ath11k@lists.infradead.org,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	linux-wireless@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [regression] mhi: ath11k resume fails on some devices
Message-ID: <20210916163529.GA9027@thinkpad>
References: <871r5p0x2u.fsf@codeaurora.org>
 <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
 <20210916111218.GA12918@thinkpad>
 <CAMZdPi94607mZorp+Zmkw3seWXak6p9Jr05CQ5hhfgKQoG8n7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMZdPi94607mZorp+Zmkw3seWXak6p9Jr05CQ5hhfgKQoG8n7Q@mail.gmail.com>

On Thu, Sep 16, 2021 at 01:18:22PM +0200, Loic Poulain wrote:
> Le jeu. 16 sept. 2021 à 13:12, Manivannan Sadhasivam <
> manivannan.sadhasivam@linaro.org> a écrit :
> 

[...]

> > If things seems to work fine without that patch, then it implies that
> > setting M0
> > state works during resume. I think we should just revert that patch.
> >
> > Loic, did that patch fix any issue for you or it was a cosmetic fix only?
> 
> 
> It fixes sdx modem resuming issue, without that we don’t know modem needs
> to be reinitialized.
> 

Okay. Then in that case, the recovery mechanism has to be added to the ath11k
MHI controller.

If that's too much of work for Kalle, then I'll look into it. But I might get
time only after Plumbers.

Thanks,
Mani
