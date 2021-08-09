Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1214C72
	for <regressions@lists.linux.dev>; Mon,  9 Aug 2021 12:12:43 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id f91so8782070qva.9
        for <regressions@lists.linux.dev>; Mon, 09 Aug 2021 05:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:references:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3O4sNg9lZ+RPsPEbPeTqhty2VenuMzMUdATYBIYMPSM=;
        b=XNTaf9kZPJjnaMNbzGwJaEi5zLEKec8dJ6Nyjir56RVuRdFezKMBvTVDOFjgF2zm6L
         JOwX+/DgvByL82JJPO5tOhJOhPvSuxuHc/hMfUHn4SlUKYf6Ql45AoBsxVURG5mkHVNE
         nFzuRMNIAlEoJasCU+Xv8tXA3AS+1lTHhx2AP7U12cqnS+cPWkPz9rL5sss1g9P/bsVj
         NIZMf732mkhnisX42mnQ/KcSBkIpNcnTH2361SELP8YjbEDGiUdwwoBsh25KU0C/77LG
         677FTS1LWftKjrqK6IXHgU696Bmanbw2cDz52CMTX/09JR5kqqbQVOpKS1MGxrbvKCeF
         4+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3O4sNg9lZ+RPsPEbPeTqhty2VenuMzMUdATYBIYMPSM=;
        b=Y0LIQu3q7htXSW3yEG5IhpDxxYOYek2zKtL/nvWe/iTaK8dA1M4MXtocYZTwGaBGDq
         hVjmmNPFfS4Jqjx/nxJtD2te9XTV4C045aV7KXhHP8Y3XQyS8Z3P43yxWocAALBhRUnE
         wOy6jR5kgN/fIcgoE1n5JhXPABIk6y08jn0O7m3bzSVxL0o07uoj9OTYDntqh7CP+w65
         JI5oC6xCl5qpgmhf1S9VtrabIhscM5t2VNPAM/E/Aex/rUsXZrK0f0m9tISTVHeSCVcX
         8W2GA565bv/zLl7a9G0N96g+YKYWYBdBxHFThUxxa3D6LM9lXcAxtURTBPouLLp/Oh7e
         +amQ==
X-Gm-Message-State: AOAM533JSkgNZ0gTcWLnjqMC6XBBbCbyD3EStn5Ha333hrQSgAW5B/hv
	oXtdWhvgiURYVOI0jDnYwYOtTgKEdts=
X-Google-Smtp-Source: ABdhPJxU0CCJPmso9N/zZleWZy/90uaT//VoYhnRpy03eIwFRX0gMFBpt3Vfj06jfQ8sTSJHtEZ/Tg==
X-Received: by 2002:ad4:4442:: with SMTP id l2mr23211998qvt.2.1628511162107;
        Mon, 09 Aug 2021 05:12:42 -0700 (PDT)
Received: from mua.localhost ([2600:1700:e380:2c20::47])
        by smtp.gmail.com with ESMTPSA id y2sm8957497qkd.38.2021.08.09.05.12.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 05:12:41 -0700 (PDT)
Subject: Re: Patch "Revert "ACPI: resources: Add checks for ACPI IRQ
 override"" has been added to the 5.13-stable tree
From: PGNet Dev <pgnet.dev@gmail.com>
To: gregkh@linuxfoundation.org, hui.wang@canonical.com,
 rafael.j.wysocki@intel.com
References: <16277146132219@kroah.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
Message-ID: <e9810931-b21c-195f-26cb-75b46aa9eb9a@gmail.com>
Date: Mon, 9 Aug 2021 08:15:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <16277146132219@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/31/21 2:56 AM, gregkh@linuxfoundation.org wrote:
> 
> This is a note to let you know that I've just added the patch titled
> 
>      Revert "ACPI: resources: Add checks for ACPI IRQ override"
> 
> to the 5.13-stable tree which can be found at:
>      http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary
> 
> The filename of the patch is:
>       revert-acpi-resources-add-checks-for-acpi-irq-override.patch
> and it can be found in the queue-5.13 subdirectory.
> 
> If you, or anyone else, feels it should not be added to the stable tree,
> please let <stable@vger.kernel.org> know about it.
> 
> 
>  From e0eef3690dc66b3ecc6e0f1267f332403eb22bea Mon Sep 17 00:00:00 2001
> From: Hui Wang <hui.wang@canonical.com>
> Date: Wed, 28 Jul 2021 23:19:58 +0800
> Subject: Revert "ACPI: resources: Add checks for ACPI IRQ override"
> 
> From: Hui Wang <hui.wang@canonical.com>
> 
> commit e0eef3690dc66b3ecc6e0f1267f332403eb22bea upstream.

Confirming that this^ revert resolves the reported non-boot regression

System does boot cleanly; but, then REboots @ 60 seconds.

It's a known bug, with fix already in 5.13.9/stable:

  Revert "watchdog: iTCO_wdt: Account for rebooting on second timeout"
  https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?h=linux-5.13.y&id=02db470b866fd06d8951

, causing TCO watchdog auto-reboot @ 60 secs.

Although particularly nasty on servers with /boot on RAID, breaking arrays if watchdog boots before arrays correctly assembled, iiuc, it's UN-related

With interim workaround

  edit /etc/modprobe.d/blacklist.conf

+	blacklist iTCO_wdt
+	blacklist iTCO_vendor_support

for this second issue in place, 5.13.8 boots & appears stable.
