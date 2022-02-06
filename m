Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF3A2F25
	for <regressions@lists.linux.dev>; Sun,  6 Feb 2022 14:57:17 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id m25so8978030qka.9
        for <regressions@lists.linux.dev>; Sun, 06 Feb 2022 06:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=6C7rbUEg2uQL4Nc+cT/M+bAdu9A/znrgfhwH+AQ1S78=;
        b=js+9iQQp99xPsgADdT8wY0caIMG3/42oheJMmMId14muj/DKyEIqCdJIOb1/1TbjHw
         jQEuJjSO8QFi3JOpLAb6iXUTNpgWQEF2cCLY/LwJi55y0+gTM/Bf1z8U9OTX4cWbRdry
         34d6R8Zu0zyobyXeCVknIk4gN0IL5oRFIJBgWenJjvzbhgienMclu1HKaGQ3ewp6o1ZY
         S+F14Ux/RloNk/Vb8W56MJQbKhF3aBImPXt3Uxca5Yk2Rjn5DvLZKixJYQW9Rj3s5KLh
         t0x3IiWvXLnVy/0b01pAJ9mMKk5X5jSYEPmm4//W3JDOmPE6FzxLicugSaA+6MU0bMNx
         7yCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=6C7rbUEg2uQL4Nc+cT/M+bAdu9A/znrgfhwH+AQ1S78=;
        b=Z/dNmO+FDo99Q7307mX7Nba1Mdm/M2UQLboMvOeKubFmegaJfSWgRIH73ONrV42ZsK
         Nn9iQoOHEjlK8Kp17zkiNobV/G1uaX4dH2dZUQekE2KA+XRgM3Om4yrCeCIeTmGWi/o3
         e8tsDdyzjNXClkYv0RajTlO2Bt7q1IYPsOM/GIa80JaZw08HPu9xJUKVh75HNjQUa/6e
         RhJP/bG4VrCrOY70fc0OPJzxKIfPJo/fcpxXjilBONDDPL+aOSZ9uTUA8mW+cugLkcYU
         PkuR0X4GjT1Fe6qkJ/0+u5ZxykWTwR3pG/CsVNWmORMq5sRgX1+SXJHZhkL+ggT72qm+
         bQeg==
X-Gm-Message-State: AOAM533ndFyU2IN7v9SWs3ZSQ5EL2tl4tY/jER4ZEQjVCrBoVw8uhy5G
	GUL75Bpr+mDpqLEgLoJemPWSC2cf/g==
X-Google-Smtp-Source: ABdhPJxLODizMUYIz9OLmczZzSGH73EUmKsUh3vN3LxBo6Y9R4Oe22U8PchvV9LhoxT2EtIMyMNmRA==
X-Received: by 2002:a05:620a:40c5:: with SMTP id g5mr4235977qko.71.1644159436715;
        Sun, 06 Feb 2022 06:57:16 -0800 (PST)
Received: from [10.1.1.242] (207-38-182-214.s3007.c3-0.wsd-cbr1.qens-wsd.ny.cable.rcncustomer.com. [207.38.182.214])
        by smtp.gmail.com with ESMTPSA id s4sm4158402qko.113.2022.02.06.06.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Feb 2022 06:57:16 -0800 (PST)
Message-ID: <4f5dccba-ab28-8007-bed8-f2594498c8c1@gmail.com>
Date: Sun, 6 Feb 2022 09:57:15 -0500
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, tech.support@broadcom.com
From: MP <fromschoollaptop@gmail.com>
Subject: Asus Router Kernel Panics
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hello all,

  Just looking for a bit of guidance here and a suggestion on proper 
next steps. I think there may be an issue within the below broadcom nand 
driver implementation.

I have an Asus GTE-AX11000 and it reboots\crashes multiple times a week, 
upon inspection of snmp logging you can see the below entries, when the 
kernel panic occurs the entire router locks up, and sometimes reboots. 
Sometimes it doesn't reboot and the router hangs completely and drops 
all network devices, and removes wireless SSIDs and all of your devices 
lose their connection.

Not sure who to turn to but Asus support has not grasped the gravity of 
this problem and I am thinking this can only really be resolved with a 
firmware\driver\linux update, so just hoping for some additional help or 
guidance from this group.


Thanks much.

https://github.com/torvalds/linux/blob/master/drivers/mtd/nand/raw/brcmnand/brcmnand.c


022-02-06 09:00:18,User.Error,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: bcm63xx_nand ff801800.nand: timeout waiting for command 0x1
2022-02-06 09:00:18,User.Error,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: bcm63xx_nand ff801800.nand: intfc status 700000e0
*2022-02-06 09:00:18,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: BUG: failure at 
drivers/mtd/nand/brcmnand/brcmnand.c:1339/brcmnand_send_cmd()!*
2022-02-06 09:00:19,User.Emerg,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: Kernel panic - not syncing: BUG!
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: CPU: 2 PID: 24207 Comm: TrafficAnalyzer Tainted: P O    4.1.52 #2
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: Hardware name: Broadcom-v8A (DT)
2022-02-06 09:00:19,User.Emerg,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: Call trace:
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: [<ffffffc000087398>] dump_backtrace+0x0/0x150
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: [<ffffffc0000874fc>] show_stack+0x14/0x20
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: [<ffffffc00057d6b0>] dump_stack+0x90/0xb0
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: [<ffffffc00057b374>] panic+0xd8/0x220
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: [<ffffffc000344cac>] brcmnand_send_cmd+0x134/0x140
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: [<ffffffc000344ea0>] brcmnand_read_by_pio+0xc8/0x318
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: [<ffffffc0003451a8>] brcmnand_read+0xb8/0x458
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: [<ffffffc0003456cc>] brcmnand_read_page+0x2c/0x38
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: [<ffffffc000340e84>] nand_do_read_ops+0x1b4/0x640
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: [<ffffffc00034163c>] nand_read+0x5c/0x88
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: [<ffffffc000336f74>] part_read+0x34/0x90
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: [<ffffffc000334890>] mtd_read+0x48/0x80
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: [<ffffffc000208718>] jffs2_flash_read+0x58/0x198
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: [<ffffffc00057c1e8>] jffs2_garbage_collect_pristine+0xa4/0x3bc
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: [<ffffffc00057c9f0>] jffs2_garbage_collect_live+0x37c/0xec8
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: [<ffffffc000203ab8>] jffs2_garbage_collect_pass+0x408/0x830
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: [<ffffffc000208094>] jffs2_flush_wbuf_gc+0xac/0x150
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: [<ffffffc0001fc0ac>] jffs2_fsync+0x44/0x60
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: [<ffffffc00016b064>] vfs_fsync_range+0x44/0xc0
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: [<ffffffc00016b138>] do_fsync+0x38/0x68
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: [<ffffffc00016b408>] SyS_fdatasync+0x10/0x20
2022-02-06 09:00:19,User.Critical,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: CPU1: stopping
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: CPU: 1 PID: 0 Comm: swapper/1 Tainted: P           O 4.1.52 #2
2022-02-06 09:00:19,User.Warning,10.1.1.1,Feb  6 09:00:18 -25F7EE8-C 
kernel: Hardware name: Broadcom-v8A (DT)
