Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FC28C0B
	for <regressions@lists.linux.dev>; Tue, 21 Feb 2023 18:59:03 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id 76so2522564iou.9
        for <regressions@lists.linux.dev>; Tue, 21 Feb 2023 10:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mpvGiAxJ/8Qfr2A8PGIWaRiwdzWv3C7JwhQUjCjxBgM=;
        b=XuBW2OZhbZbdOHi7xzAGffq/bOBCjpX9sODm7nfPDRTf04pI1m/5DMyufBp/pVgGyl
         5K9Le9MjbvT4fQq9pWQfyJ8d8lJpl8Va3zZinig0GdcX6wJmVQqRliTLL9nMmFGrZmKd
         nwhRpsm2CV9v8XWfjkADtrVDLXz3H1/EOCgiJvD+RFCU6efKp/xf3YP6R1bsmSDH60/p
         arD7RAczTkl99dcLl3ZlbIrt02A/GZLbzVS+uzgPRUDFYEncrKWJTErkkzJw6IADVSKI
         8e3V+JKYcfXPqpiE8Gc+bbYj+u78Y3q1qSXULu88eZDvEHfIQb84cHeIjthWM7Mpv+/7
         52uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mpvGiAxJ/8Qfr2A8PGIWaRiwdzWv3C7JwhQUjCjxBgM=;
        b=M1vuu1i4rmy0ur+4RoAMIDBEUdaOdcfNZbPdyV4vxyfo6wMVbWmTvMXja98ydHmBCq
         uqPoPDfLNciJdXOIH5ExN5xXcq2zIbAgt95v4ptnDbKnq9yzlmGGs7y6liSZ3dQQHSIW
         nST7OfWGUgNCzSUkKc+eXDG2ILkH6pQlRj3o+4LpYgcjWPHiJL9ZYi8+n1V7STKMWVIN
         Ecr8mGuJQ77GladQbgedGr/pooHE3hOmp73A/9+bzs4vTxcjb9OLRTxQD1S3ceGI52eB
         RPTD+uLxRYS31p+TxHGr6EPYFdTtTq3A776Ou3hLeBkjDUyoVA7FDlsJQ/B37VUdg8gX
         /KLQ==
X-Gm-Message-State: AO0yUKW2fK6O8CHK8ddcC4Z3vgN9jG4PAC8GDaDX0GOZQuRwom9k4y41
	DmeU4YTgw79uhYhico6L2QA=
X-Google-Smtp-Source: AK7set84a5dwvd0KJzzcx2WZSoE0v1VRaZMaG6aVz24dveyeOZQyBhct20g+5BN4a1vsShbRDMm4bA==
X-Received: by 2002:a5d:8418:0:b0:71d:ef29:9064 with SMTP id i24-20020a5d8418000000b0071def299064mr10496861ion.17.1677005942346;
        Tue, 21 Feb 2023 10:59:02 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v13-20020a5d940d000000b0071664d0a4d7sm734818ion.49.2023.02.21.10.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 10:59:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <aa9c822c-f673-9391-84b4-05487566a3c0@roeck-us.net>
Date: Tue, 21 Feb 2023 10:59:00 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>,
 Christian Bach <christian.bach@scs.ch>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 =?UTF-8?B?Y3lfaHVhbmco6buD5ZWf5Y6fKQ==?= <cy_huang@richtek.com>
References: <ZR0P278MB0773545F02B32FAF648F968AEB319@ZR0P278MB0773.CHEP278.PROD.OUTLOOK.COM>
 <ZR0P278MB0773072DD153BA902AFE635AEB319@ZR0P278MB0773.CHEP278.PROD.OUTLOOK.COM>
 <Y1fYjmtQZa53dPfR@kroah.com>
 <ZR0P278MB07731B49E8938F98DB2098ABEBA49@ZR0P278MB0773.CHEP278.PROD.OUTLOOK.COM>
 <Y/PB87qws1ko77xg@kroah.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: AW: tcpci module in Kernel 5.15.74 with PTN5110 not working
 correctly
In-Reply-To: <Y/PB87qws1ko77xg@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/20/23 10:54, Greg KH wrote:
> On Mon, Feb 20, 2023 at 04:45:32PM +0000, Christian Bach wrote:
>> Hello everyone
>>
>> We finally found a solution to the problem we had with the PTN5110 Chip and the Kernel Module tcpci that manages this chip in 5.15.xx Kernel. NXP Patched their Kernel a while ago (https://source.codeaurora.org/external/imx/linux-imx/commit/drivers/usb/typec/tcpm/tcpci.c?h=lf-5.15.y&id=2a263f918b25725e0434afa9ff3b83b1bc18ef74) and we reimplemented the NXP patch for the Kernel 5.15.91. I attached my reworked patch below:
>>
>> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
>> index 5340a3a3a81b..0d715e091b78 100644
>> --- a/drivers/usb/typec/tcpm/tcpci.c
>> +++ b/drivers/usb/typec/tcpm/tcpci.c
>> @@ -628,6 +628,9 @@ static int tcpci_init(struct tcpc_dev *tcpc)
>>          if (ret < 0)
>>                  return ret;
>>
>> +       /* Clear fault condition */
>> +       regmap_write(tcpci->regmap, TCPC_FAULT_STATUS, 0x80);
>> +

This should probably clear all fault bits. Also, the specification
suggests to clear the fault bits prior to clearing fault alert event.

>>          if (tcpci->controls_vbus)
>>                  reg = TCPC_POWER_STATUS_VBUS_PRES;
>>          else
>> @@ -644,7 +647,8 @@ static int tcpci_init(struct tcpc_dev *tcpc)
>>
>>          reg = TCPC_ALERT_TX_SUCCESS | TCPC_ALERT_TX_FAILED |
>>                  TCPC_ALERT_TX_DISCARDED | TCPC_ALERT_RX_STATUS |
>> -               TCPC_ALERT_RX_HARD_RST | TCPC_ALERT_CC_STATUS;
>> +               TCPC_ALERT_RX_HARD_RST | TCPC_ALERT_CC_STATUS |
>> +               TCPC_ALERT_V_ALARM_LO | TCPC_ALERT_FAULT;
>>          if (tcpci->controls_vbus)
>>                  reg |= TCPC_ALERT_POWER_STATUS;
>>          /* Enable VSAFE0V status interrupt when detecting VSAFE0V is supported */
>> @@ -728,6 +732,13 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>>                          tcpm_vbus_change(tcpci->port);
>>          }
>>
>> +       /* Clear the fault status anyway */
>> +       if (status & TCPC_ALERT_FAULT) {
>> +               regmap_read(tcpci->regmap, TCPC_FAULT_STATUS, &raw);
>> +               regmap_write(tcpci->regmap, TCPC_FAULT_STATUS,
>> +                               raw | TCPC_FAULT_STATUS_MASK);

TCPC_FAULT_STATUS_MASK is a register address, so this doesn't really
make sense. If the idea is to reset all active fault bits, just write
0xff. However, if faults are not really handled, it might be better
to set TCPC_FAULT_STATUS_MASK to 0 instead of enabling fault alerts.

It would probably be better to actually handle faults, but that may
be more complex, and someone would have tho be able to test any
changes.

Guenter

>> +       }
>> +
>>          if (status & TCPC_ALERT_RX_HARD_RST)
>>                  tcpm_pd_hard_reset(tcpci->port);
>>
>>
>>
>>
>>
>>
>>
> 
> Can you submit this as a real fix so that we can apply it properly?
> 
> thanks,
> 
> greg k-h

