Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9396C7A
	for <regressions@lists.linux.dev>; Thu, 16 Jun 2022 06:07:07 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id q12-20020a17090a304c00b001e2d4fb0eb4so853215pjl.4
        for <regressions@lists.linux.dev>; Wed, 15 Jun 2022 23:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FzWTxlTEFKqkIMF8VbZ/u79TNhEtmzp0He+3d50zpFI=;
        b=gluYI+a2xyVpoiDSRgRE3aiBySLr/MvVpJhF/5gH6NQ/IzZ5FBsroCTSnkAer7SxZz
         W6fvUIoaXyksi09EF38+yDEhuCr6ISFS9WLGoqsKdwJxIrOmq3f6awfAjrFtqk9Z2Hln
         S6+CjFTUqSxcRm4xE+iktjVPZFTZoOJBAd6gIyhHJM0t2/3GINPkAVOwR8IwUtDJxw6+
         WyMce/7H8xQPnd6K4L9mgoxsF9orwEK3zLUZS2p61QDJCBlXxWqP9dHqNpDxCNCZe6yP
         iqJFrJt/A2Hpr88pklbj4Gmi4nOxcHONmk9BnypVTTMUt+EDBunXkq4YjNO1HqcQnrxp
         8AdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FzWTxlTEFKqkIMF8VbZ/u79TNhEtmzp0He+3d50zpFI=;
        b=vvGUWcn8W8eTIUpvYOIf+57kety4pUJYxC9nV7tERiWqMpOJTje8rsVDt9RSQEjxPQ
         0c5rZyV7o2xzDg3RGoOm3hN8sLa+pinxU0MVM4VE3S+HZfdjzyHdke+6W6zcpV0pMhlE
         ZnZvdBqrRnDmm+I/PF3tmLVRiv5tXACj7POEzCty+ZGOt5yCwHf1ijJjBTUGnhsOY5iW
         3ziGjqf6tW893c3usOWEED081XN45Lwg0E1BgEU3Van5Vhq5aJ/a0+tqFHfsNTUSeHjg
         MsARPrwk4GwjgU2jtygdCnP0NVD1kWteJLwt9mK2qFUILBy87xSVcRe3Zkr8TcBnuRZX
         60OQ==
X-Gm-Message-State: AJIora+ltvOahzanG6YSrv8g5YYpXXp1A8UrQ9wBfiLM0Zs3HXo9F80X
	/IKOAPfX5CGBMEXYTvXYSbW9nw==
X-Google-Smtp-Source: AGRyM1uFVCYBfTZ45/hWPa8qzjODUT5VMMm2n4TRbyVDluISTJi+yoWsZCF8oFjXmUxFfWbuNSVw8g==
X-Received: by 2002:a17:90b:3a8b:b0:1e8:3056:10fc with SMTP id om11-20020a17090b3a8b00b001e8305610fcmr3349878pjb.145.1655359627030;
        Wed, 15 Jun 2022 23:07:07 -0700 (PDT)
Received: from localhost ([122.162.234.2])
        by smtp.gmail.com with ESMTPSA id j3-20020a170903024300b00161947ecc82sm695345plh.199.2022.06.15.23.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 23:07:06 -0700 (PDT)
Date: Thu, 16 Jun 2022 11:37:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	regressions@lists.linux.dev,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Linux PM <linux-pm@vger.kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [next] arm64: db410c: WARNING: CPU: 0 PID: 1 at
 drivers/opp/core.c:2265 dev_pm_opp_clear_config+0x174/0x17c
Message-ID: <20220616060704.xcxdqlm5fo7e7et4@vireshk-i7>
References: <CA+G9fYsP05V+bVoZsPto-ZdZra3Mo4unBjNqyk1dOjfMEK1XWg@mail.gmail.com>
 <20220615052503.6dvtnuq2ai45pmro@vireshk-i7>
 <CA+G9fYvifz5xDDNjoJBt2MRfdqwDtNf53teWXUs5QCOn2uhbfw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvifz5xDDNjoJBt2MRfdqwDtNf53teWXUs5QCOn2uhbfw@mail.gmail.com>

On 16-06-22, 00:56, Naresh Kamboju wrote:
> As per your suggestion, I have tested [1] this tree and branch and it worked.
> The reported kernel warning has been fixed.
> Thank you.
> 
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

Thanks Naresh.

-- 
viresh
