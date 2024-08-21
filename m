Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35172175A6
	for <regressions@lists.linux.dev>; Wed, 21 Aug 2024 05:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724216965; cv=none; b=m6U9LP4aK4YdmFsb+sD99T/VPRGH9Ui9ji6qjIb3ArCRt8/R81R2v3KFht1xUp9EI1yi3d526W7eMK4KlaDU/jyMN9SizBORrBxh+b2jMkzb6hBYlmluhGlZlHzpH1L0aXhX19OuX+QiKxJj0KX/kenpjiTQ9S3bz9BkF/fadn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724216965; c=relaxed/simple;
	bh=cLiCYiXS25Xlf0dh4DbE+mTVWRQPILO7MGKR9lCv5L0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aVhiIzl4ITSjNZbVI865zh9NIPQNg2HKvSXXOCiFv28uQT+m9Pl1kO9XHUq/qcy7igILmNeDO5Y2zASQ4qWrM4tJKOcZWnD3EtZz1iulTZdfDMdkYbwbI81BcwRYl5s0eBK+P4D1dXaa59rMPVmRDrOj4x3OXf5LCYYkyadvdsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-371b97cfd6fso2127583f8f.2
        for <regressions@lists.linux.dev>; Tue, 20 Aug 2024 22:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724216962; x=1724821762;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kdvr3vsjNyF52JtCUkc2L1/v/zvdzK9Ic64vH1PZOq8=;
        b=IhzCGNiNEOW5guXhBG+XBqCc8v9rCVwoddvGi38ZBUIYgfSpNzZ0Ws0cOGqQB9xHGH
         2h8UAJ1qXg1bH6K6W4tWCuY249+d545g/UItxDmv05wmNHT7gQ8rywSTWjMosUcLtfnT
         t2qNBI7HwZiF1SUY/LLcivlsrx8q/u/1FdZWoak31IPCmduq/WabfZ3fqBftrCFPIC/9
         R/I8ZYokPhkWl/qExlT56bZyk8Dn0auJaXiD1uXvyOMMZoWK1IV4VZy43Iu7f5w1Un+r
         A2mqFyIBOUq4+dXS39DQvkbMwt5Fzg0YvdvouuwlI9cfccSmUXesb2nWlLt3em/8Q01I
         r0YA==
X-Forwarded-Encrypted: i=1; AJvYcCU0ttZJtJx+bZw/ynVW+wrpjYlDChna2iyG+5YrB8ur3LL9Hzox0ZkB2do92A2yyGydYHpbGi9gaf7wGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxd6xWjGuVcVIDH2jBV49dMhOFS6Z87cGtcOXhU8cTKEVBA78vT
	V8TlX5vPDLAJTDG7w4Bl/4vkyTiNnOGMptNrEgBvJ1gsI3ZJQ++Y
X-Google-Smtp-Source: AGHT+IFC+H4F04UVve3eU5bbnNUszYbRb6wUtv+vOGJqJygUV5UOMblQx6KJUIV8GGsZjVSSaKInLQ==
X-Received: by 2002:a5d:6483:0:b0:371:8eaf:3c49 with SMTP id ffacd0b85a97d-372fd82bf2bmr698882f8f.40.1724216962083;
        Tue, 20 Aug 2024 22:09:22 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:69? ([2a0b:e7c0:0:107::aaaa:69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37195c57d48sm12533357f8f.53.2024.08.20.22.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 22:09:21 -0700 (PDT)
Message-ID: <f0552842-7824-424e-af21-ac9eb3c5c14d@kernel.org>
Date: Wed, 21 Aug 2024 07:09:20 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ACPI IRQ storm with 6.10
To: Bjorn Helgaas <helgaas@kernel.org>, Petr Valenta <petr@jevklidu.cz>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Len Brown <lenb@kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 Linux kernel mailing list <linux-kernel@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Tony Nguyen <anthony.l.nguyen@intel.com>, przemyslaw.kitszel@intel.com,
 intel-wired-lan@lists.osuosl.org, "Rafael J. Wysocki" <rafael@kernel.org>
References: <20240820213035.GA226181@bhelgaas>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20240820213035.GA226181@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20. 08. 24, 23:30, Bjorn Helgaas wrote:
> On Tue, Aug 20, 2024 at 11:13:54PM +0200, Petr Valenta wrote:
>> Dne 20. 08. 24 v 20:09 Bjorn Helgaas napsal(a):
>>> On Mon, Aug 19, 2024 at 07:23:42AM +0200, Jiri Slaby wrote:
>>>> On 19. 08. 24, 6:50, Jiri Slaby wrote:
>>>>> CC e1000e guys + Jesse (due to 75a3f93b5383) + Bjorn (due to b2c289415b2b)
>>>>
>>>> Bjorn,
>>>>
>>>> I am confused by these changes:
>>>> ==========================================
>>>> @@ -291,16 +288,13 @@ static int e1000_set_link_ksettings(struct net_device
>>>> *net
>>>> dev,
>>>>            * duplex is forced.
>>>>            */
>>>>           if (cmd->base.eth_tp_mdix_ctrl) {
>>>> -               if (hw->phy.media_type != e1000_media_type_copper) {
>>>> -                       ret_val = -EOPNOTSUPP;
>>>> -                       goto out;
>>>> -               }
>>>> +               if (hw->phy.media_type != e1000_media_type_copper)
>>>> +                       return -EOPNOTSUPP;
>>>>
>>>>                   if ((cmd->base.eth_tp_mdix_ctrl != ETH_TP_MDI_AUTO) &&
>>>>                       (cmd->base.autoneg != AUTONEG_ENABLE)) {
>>>>                           e_err("forcing MDI/MDI-X state is not supported when
>>>> lin
>>>> k speed and/or duplex are forced\n");
>>>> -                       ret_val = -EINVAL;
>>>> -                       goto out;
>>>> +                       return -EINVAL;
>>>>                   }
>>>>           }
>>>>
>>>> @@ -347,7 +341,6 @@ static int e1000_set_link_ksettings(struct net_device
>>>> *netde
>>>> v,
>>>>           }
>>>>
>>>>    out:
>>>> -       pm_runtime_put_sync(netdev->dev.parent);
>>>>           clear_bit(__E1000_RESETTING, &adapter->state);
>>>>           return ret_val;
>>>>    }
>>>> ==========================================
>>>>
>>>> So no more clear_bit(__E1000_RESETTING in the above fail paths. Is that
>>>> intentional?
>>>
>>> Not intentional.  Petr, do you have the ability to test the patch
>>> below?  I'm not sure it's the correct fix, but it reverts the pieces
>>> of b2c289415b2b that Jiri pointed out.
>>
>> I tested the patch below but it didn't help. After the first boot with new
>> kernel it looked promising as the irq storm only appeared for a few seconds,
>> but with subsequent reboots it was the same as without the patch.
> 
> Thank you very much for testing that!


>> To be sure, I also send the md5sum of ethtool.c after applying the patch:
>>
>> a25c003257538f16994b4d7c4260e894 ethtool.c
> 
> Thanks, that matches what I get when applying the patch on v6.10.
> 
> I'm at a loss.  You could try reverting the entire b2c289415b2b commit
> (patch for that is below).

FWIW he already tested with b2c289415b2b reverted (I provided him with a 
built kernel). It behaves the same. So you are not the breaker.

> If that doesn't help, I guess you could try reverting the other
> commits Jiri mentioned:
> 
>    76a0a3f9cc2f e1000e: fix force smbus during suspend flow
>    c93a6f62cb1b e1000e: Fix S0ix residency on corporate systems
>    bfd546a552e1 e1000e: move force SMBUS near the end of enable_ulp function
>    6918107e2540 net: e1000e & ixgbe: Remove PCI_HEADER_TYPE_MFD duplicates
>    1eb2cded45b3 net: annotate writes on dev->mtu from ndo_change_mtu()
>    b2c289415b2b e1000e: Remove redundant runtime resume for ethtool_ops
>    75a3f93b5383 net: intel: implement modern PM ops declarations
> 
> If you do this, I would revert 76a0a3f9cc2f, test, then revert
> c93a6f62cb1b in addition, test, then revert bfd546a552e1 in addition,
> etc.

Or perhaps easier to do:
   git bisect v6.10 v6.9 -- drivers/net/ethernet/intel/e1000e/
directly. But that assumes one of the above commits broke it. If they 
did not, as a last resort, you can still do full bisect (without the "-- 
drivers" part).

I would take v6.10 suses config.
Would boot 6.10.
do lsmod > /tmp/lsmod
make LSMOD=/tmp/lsmod localyesconfig
make bzImage
and use that bzImage.

Note that graphics, wireless and other stuff will be defunct unless you 
build in firmwares for them (EXTRA_FIRMWARE config). Alternatively use 
localmodconfig and build and install also modules (now limited to your 
machine).

thanks,
-- 
js
suse labs

