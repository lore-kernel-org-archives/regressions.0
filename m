Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC87C8D1
	for <regressions@lists.linux.dev>; Sat, 10 Jun 2023 15:04:02 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5144a9c11c7so1688690a12.2
        for <regressions@lists.linux.dev>; Sat, 10 Jun 2023 08:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686409442; x=1689001442;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A+2DK6e0ExwNggdgQrYc3qCt4Ssgi+vxV8OCcu+bbSs=;
        b=gvsv72o9w6vFzFAPtn68Ti4E0qduiA2pq3/hpKudZOCgXbITP5aYli2YGrmgtWO8BK
         bkD17rCEFbBAW25pfreRVFBUtm3vizvotUjx2OOxS0Wb5qYuxeNgPJ+y1X/ntrO95A6D
         bKtz7jDR3zVEupPm4f3YYhMCgBPPIQXw8TcZZcfQbdeKdxv+olvcweLjbNzy+unMBlI3
         WR2BnMZAuSGXsLOnDV/4bHY8+YRTfYIGzHzWMFleujmuMRm6DrZ1g+h7YVdgewgCstdL
         s26v0EvXIqWbpMgoPBI5LD0eyQFLSY9maJQ9PEbcZVfgeyjgpe8wRSZ/Vonfb9k1F8p7
         tf/g==
X-Gm-Message-State: AC+VfDwzhBvrIU4irfNGrTw/eIsooN8cNq4Fy2G/CUvRj2KLJjj9dTjt
	CXuOuxiLLHXG4zP1WK6WcqI=
X-Google-Smtp-Source: ACHHUZ5t/ck9Yx8w0Ts2mCKfu3UlWc1gun1eU3jLZdNKvdus7uTM+1aYKzQpak5qo25X7YqamCyyBg==
X-Received: by 2002:a17:903:3293:b0:1af:9b8a:9c79 with SMTP id jh19-20020a170903329300b001af9b8a9c79mr2086591plb.34.1686409441578;
        Sat, 10 Jun 2023 08:04:01 -0700 (PDT)
Received: from [192.168.3.219] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id u10-20020a170902bf4a00b001b2063d43a7sm5073944pls.249.2023.06.10.08.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 08:04:01 -0700 (PDT)
Message-ID: <02e4f87a-80e8-dc5d-0d6e-46939f2c74ac@acm.org>
Date: Sat, 10 Jun 2023 08:03:59 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: Fwd: Waking up from resume locks up on sr device
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Damien Le Moal <dlemoal@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Thorsten Leemhuis <linux@leemhuis.info>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Phillip Potter <phil@philpotter.co.uk>,
 Joe Breuer <linux-kernel@jmbreuer.net>,
 Linux Power Management <linux-pm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Hardening <linux-hardening@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux SCSI <linux-scsi@vger.kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Dan Williams <dan.j.williams@intel.com>, Hannes Reinecke <hare@suse.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <2d1fdf6d-682c-a18d-2260-5c5ee7097f7d@gmail.com>
 <5513e29d-955a-f795-21d6-ec02a2e2e128@gmail.com>
 <ZIQ6bkau3j6qGef8@duo.ucw.cz>
 <07d6e2e7-a50a-8cf4-5c5d-200551bd6687@gmail.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <07d6e2e7-a50a-8cf4-5c5d-200551bd6687@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/23 06:27, Bagas Sanjaya wrote:
> On 6/10/23 15:55, Pavel Machek wrote:
>>>> #regzbot introduced: v5.0..v6.4-rc5 https://bugzilla.kernel.org/show_bug.cgi?id=217530
>>>> #regzbot title: Waking up from resume locks up on SCSI CD/DVD drive
>>>>
>>> The reporter had found the culprit (via bisection), so:
>>>
>>> #regzbot introduced: a19a93e4c6a98c
>> Maybe cc the authors of that commit?
> 
> Ah! I forgot to do that! Thanks anyway.

Hi Damien,

Why does the ATA code call scsi_rescan_device() before system resume has
finished? Would ATA devices still work with the patch below applied?

Thanks,

Bart.


diff --git a/drivers/scsi/scsi_scan.c b/drivers/scsi/scsi_scan.c
index 6a959c993dd8..be3971b7fd27 100644
--- a/drivers/scsi/scsi_scan.c
+++ b/drivers/scsi/scsi_scan.c
@@ -1629,6 +1629,20 @@ void scsi_rescan_device(struct device *dev)
  {
  	struct scsi_device *sdev = to_scsi_device(dev);

+#ifdef CONFIG_PM_SLEEP
+	/*
+	 * The ATA subsystem may call scsi_rescan_device() before resuming has
+	 * finished. If this happens, prevent a deadlock on the device_lock()
+	 * call by skipping rescanning.
+	 */
+	if (dev->power.is_suspended)
+		return;
+#endif
+
+	/*
+	 * Serialize scsi_driver.rescan() calls and scsi_driver.gendrv.remove()
+	 * calls.
+	 */
  	device_lock(dev);

  	scsi_attach_vpd(sdev);

