Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D7129CA
	for <regressions@lists.linux.dev>; Mon, 23 Aug 2021 16:17:22 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id b9so6072619plx.2
        for <regressions@lists.linux.dev>; Mon, 23 Aug 2021 09:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=D1vc0Du1QRW2K7m2nHISIwEFAgR/2yZeAXrP2XUTUTo=;
        b=TTf1KxFTr9AaSHU/sjS+bu71irZm+4W1oB8XVgfBcxuzm3nzN40bA6iQuoU/XCvj1K
         zjiVgWBAPnQSESV0TdfLbp0z8WPY0umBWaRB+eVPT8VkgVhNWKfy3I2t4jcWduZz9fkQ
         +eSNsygoa/t9g/n2f4M4LkK3GEfRVelJC9W24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D1vc0Du1QRW2K7m2nHISIwEFAgR/2yZeAXrP2XUTUTo=;
        b=nlhPPhFc9jRev/CVpUYCaYWJBtPHxn1GKa1MZVegjBjDl0rBMZIqm/23KerR0Eydzh
         6trwTD1NNOavfeqrWxAM9MjB2Yxkyg2Xr8PfRTsLgQh5i72ywsV626Q++Edn8fGcBsXE
         YdMP0Czexh6+b1ue0UUWqKuE7Kk+GJ+qDIEfQ/iwzsCmom1BGbQ/xUJnA2GRBfKooKbq
         LJiJICkJl0icqIM/tWlAF/joTfK0+KmFFq2whVmSYZKBxaJsAeJ1K5lhCJB/WTHnoGaJ
         Ibz1dpVPIjQcoBlos15zFDAkqfV0PvG/pAwdNiDUsKSm+fkSicPjF8yBYLzhsfyX3448
         dkhg==
X-Gm-Message-State: AOAM5321hySGF+Lk9L0K7zDUkVyw6ciKADdb9qXJRvce3rBedN5IZR4Y
	p2IX+W0z/Zi6lkX3VRsfkqPQug==
X-Google-Smtp-Source: ABdhPJw47ln4dJxLu524q5oWrRuKZ39R/vavsLyK8rTDU02DD5CkulpAi+I+gx5ZjNLR0Phs13miQw==
X-Received: by 2002:a17:90a:4409:: with SMTP id s9mr20665276pjg.125.1629735442052;
        Mon, 23 Aug 2021 09:17:22 -0700 (PDT)
Received: from braindead.localdomain (c-71-202-115-154.hsd1.ca.comcast.net. [71.202.115.154])
        by smtp.gmail.com with ESMTPSA id b20sm19580946pji.24.2021.08.23.09.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 09:17:21 -0700 (PDT)
Subject: Re: 5.14 rc6 broken for QCA6390 on Dell XPS 13 9310
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 regressions@lists.linux.dev,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Hemant Kumar <hemantk@codeaurora.org>, Loic Poulain <loic.poulain@linaro.org>
References: <a8cddf24-ecfc-088e-27f4-98cbbb5fb67c@penguintechs.org>
 <87y28sqq4l.fsf@codeaurora.org>
From: Wren Turkal <wt@penguintechs.org>
Message-ID: <d2795e7c-69cf-557d-19c4-f800c3a80997@penguintechs.org>
Date: Mon, 23 Aug 2021 09:17:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87y28sqq4l.fsf@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/23/21 5:53 AM, Kalle Valo wrote:
> Do you get the same mhi error as in the forum post?
> 
> qcom_mhi_qrtr: probe of mhi0_IPCR failed with error -22
> 
> MHI folks, any ideas? I have XPS 13 9310 myself but I'm not able to test
> v5.14-rc6 kernel right now.

Yes, I get that same message in my logs.

FWIW, ath11k_pci now does not get loaded on boot. I can manually load 
it, but it doesn't seem to do anything.

wt
-- 
You're more amazing than you think! ymatyt.com
