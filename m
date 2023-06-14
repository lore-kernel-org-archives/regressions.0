Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5989E7F
	for <regressions@lists.linux.dev>; Wed, 14 Jun 2023 18:04:59 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-662f0feafb2so5166839b3a.1
        for <regressions@lists.linux.dev>; Wed, 14 Jun 2023 11:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765899; x=1689357899;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bfg7Pd8Qi4XV2mpEzR1AaDAP2KYNRF3glqHqxSDiUr8=;
        b=RwnZ0mqftyxMzJZlqHxbwnEo2xUqEe603uSP6lZsI2DYcTikrmplx5qIYc5X1IiJUZ
         we4J4Sw+iejdpIl7cOun9c6oZGzMwGlvujGjlJMje/LoOoxqedREw9ngbjQl4YEAouKp
         CI4ZlFpS2ch30qou9kP3PnGKnqtgmLBIIyKt1ih1t0FJ/DwvThtk2HZaJ9HwJrZ4wrPH
         fdDFjNtGqspMqh9mlsx3sa44y7s8zgJk1mOnUc7bbYBeC6XuvWCiywWRPjnr7wDtEnZ+
         vWW1dt9jq7Y/I3mBX3hMuDTFqavmAW6KDdY+FbazTD6spY+ruHxbSw+9jkrLGTzVszQO
         ktRQ==
X-Gm-Message-State: AC+VfDwfV0NVm1KW97isGe8XE6tDsQDPxdo2QCQnb8XjJOwMRzTJ2NfL
	8xh/70oGedtim47M4s2x7x0=
X-Google-Smtp-Source: ACHHUZ508hquoDPA8b1+rAI5xOdbxD25gvcdJEa+YPdfH/GWCtVoyJJzwmdFY/bbOKj3msllkxqV3A==
X-Received: by 2002:a05:6a20:4424:b0:11a:ce33:563a with SMTP id ce36-20020a056a20442400b0011ace33563amr3161528pzb.15.1686765898436;
        Wed, 14 Jun 2023 11:04:58 -0700 (PDT)
Received: from [192.168.51.14] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id a12-20020aa780cc000000b0063d24fcc2besm1595325pfn.125.2023.06.14.11.04.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 11:04:57 -0700 (PDT)
Message-ID: <3f85cb4a-8b14-623f-eb4e-40baab1ed888@acm.org>
Date: Wed, 14 Jun 2023 11:04:55 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Fwd: Waking up from resume locks up on sr device
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>,
 Damien Le Moal <dlemoal@kernel.org>
Cc: Hannes Reinecke <hare@suse.de>, Joe Breuer <linux-kernel@jmbreuer.net>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Thorsten Leemhuis <linux@leemhuis.info>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Phillip Potter <phil@philpotter.co.uk>,
 Linux Power Management <linux-pm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Hardening <linux-hardening@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux SCSI <linux-scsi@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Hannes Reinecke <hare@suse.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <2d1fdf6d-682c-a18d-2260-5c5ee7097f7d@gmail.com>
 <5513e29d-955a-f795-21d6-ec02a2e2e128@gmail.com>
 <ZIQ6bkau3j6qGef8@duo.ucw.cz>
 <07d6e2e7-a50a-8cf4-5c5d-200551bd6687@gmail.com>
 <02e4f87a-80e8-dc5d-0d6e-46939f2c74ac@acm.org>
 <b2cf6d96-a55a-d444-d22e-e9b3945ba43f@jmbreuer.net>
 <84f1c51c-86f9-04b3-0cd1-f685ebee7592@kernel.org>
 <37ed36f0-6f72-115c-85fb-62ef5ad72e76@suse.de>
 <b0fdf454-b2f7-c273-66f5-efe42fbc2807@kernel.org>
 <859f0eda-4984-4489-9851-c9f6ec454a88@rowland.harvard.edu>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <859f0eda-4984-4489-9851-c9f6ec454a88@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/14/23 07:26, Alan Stern wrote:
> On Wed, Jun 14, 2023 at 04:35:50PM +0900, Damien Le Moal wrote:
>> Or... Why the heck scsi_rescan_device() is calling device_lock() ? This
>> is the only place in scsi code I can see that takes this lock. I suspect
>> this is to serialize either rescans, or serialize with resume, or both.
>> For serializing rescans, we can use another lock. For serializing with
>> PM, we should wait for PM transitions...
>> Something is not right here.
> 
> Here's what commit e27829dc92e5 ("scsi: serialize ->rescan against
> ->remove", written by Christoph Hellwig) says:
> 
>      Lock the device embedded in the scsi_device to protect against
>      concurrent calls to ->remove.
> 
> That's the commit which added the device_lock() call.

Even if scsi_rescan_device() would use another mechanism for 
serialization against sd_remove() and sr_remove(), we still need to 
solve the issue that the ATA code calls scsi_rescan_device() before 
resuming has finished. scsi_rescan_device() issues I/O. Issuing I/O to a 
device is not allowed before that device has been resumed.

Thanks,

Bart.
