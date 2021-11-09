Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468FC2C83
	for <regressions@lists.linux.dev>; Tue,  9 Nov 2021 15:22:34 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id bi35so45178719lfb.9
        for <regressions@lists.linux.dev>; Tue, 09 Nov 2021 07:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=exuvo-se.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GcVUHwm/eJAM3fbrKDDGYlEYtYCiryEx3rFGza3K/4o=;
        b=jHwn4dVwIlptfxRjWoZbgr4hx+IT4CBSOk7Sra0w9UwVFgYLVkZER2UU1RNjEDlXB3
         PugklcFTNIG2ABeD+IxF2OBE2/lEUJk4je6ZkhVzl7XfAwOdv8Q1VYYE6KzQ6egyi4fg
         E0jwWGa70FG9j6108byRX7hRvOx6p23fVzhtIwbzAeBgC2ELY3JQZAHS90k8Zan1EwLY
         7cuDTvE27MzkMl4c9u1lnnHVwtDgtIB9oTFO0K0P2v952gfcMudZ6d6kpNqGISOoxLbk
         ismy32NDTinVPtKSqiCGYdMh8Lv9X4NYcoUOH6bOsn3oYEJteSmAMpj+w62IeR4G5BiB
         jVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GcVUHwm/eJAM3fbrKDDGYlEYtYCiryEx3rFGza3K/4o=;
        b=h+UN3Ir+QK3deyqdEs6S/HKbAfS5sF/wZdloBr3XLXTBdYF6O+SyGX4hYyXFyNzsq8
         Xo0bYZpYUHRJauQul6Or2QZ2tPumXCnyH7GAbgImG5y6WKrUPgtfA6DmmRQbd/a81I4t
         x8qKY9zUeGAeLvEHLyO6W6cFosrTWr9v6s+0ivforMkhdZdRQ52WnV8ZzHuNCX9Tw2iy
         riIwW9BVqcmvreGVk1DQ+CO62T/wYzsCynjJid+JGZrJGln/gbbg9+itv8JxEAxyNX5O
         h3Gbj3l02ghmx3N0nxe46L5jlAUPChC0yYP78ysnV/T7JM3LOvh/UwqWK3402xP28+Y3
         f6Jw==
X-Gm-Message-State: AOAM531dDZlDc+sqF3cXEAdfUIg7GMVrJcF1K3Ad6kOP8kRjx/OuTdPI
	7/udXbusnhwcg1GttqeUke+YdQ==
X-Google-Smtp-Source: ABdhPJxq1n6uE/+cplvZ09vkFXDhN1T8ui3iM2ewFV7amxDQqh4ZbpuPjagF9SN4ed8/OojIrYMaww==
X-Received: by 2002:ac2:55a5:: with SMTP id y5mr7645335lfg.468.1636471352109;
        Tue, 09 Nov 2021 07:22:32 -0800 (PST)
Received: from ?IPV6:2001:9b0:218:2b00::30? ([2001:9b0:218:2b00::30])
        by smtp.googlemail.com with ESMTPSA id m8sm521735lfq.27.2021.11.09.07.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 07:22:31 -0800 (PST)
Message-ID: <c81f829d-fd87-7580-fb9a-1a84958f890f@exuvo.se>
Date: Tue, 9 Nov 2021 16:22:31 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: rt2x00 regression
Content-Language: en-US
To: Stanislaw Gruszka <stf_xl@wp.pl>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Stanislaw Gruszka <sgruszka@redhat.com>, linux-wireless@vger.kernel.org,
 Helmut Schaa <helmut.schaa@googlemail.com>, regressions@lists.linux.dev,
 Kalle Valo <kvalo@codeaurora.org>
References: <CA+GwT0B5SyRZnGLqwqOeuJK4CWMVc=dKaWre9VN8KQC6kBzKGw@mail.gmail.com>
 <20191203075736.GA701@redhat.com>
 <d74dab51-3a84-9035-d89e-ea8f63e89198@exuvo.se>
 <a8eeb0bc-95da-291a-7fb9-5d15d1174c27@exuvo.se>
 <c22673af-40e0-3af2-5ab7-69b23fc03598@exuvo.se>
 <f935dc15-08bd-2e28-fc1b-b27634c618be@exuvo.se>
 <87czop5j33.fsf@tynnyri.adurom.net>
 <6366d9bd-9752-dbc2-8970-442bdc6e8eea@leemhuis.info>
 <7d353dd2-2ffb-6d5e-9983-f983c8b4f6da@leemhuis.info>
 <20211109073127.GA109212@wp.pl> <20211109120737.GA120005@wp.pl>
From: Exuvo <exuvo@exuvo.se>
In-Reply-To: <20211109120737.GA120005@wp.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Just tested it and it passes the rt2x00lib_load_firmware but still errors on rt2800usb_set_device_state:

[  348.363942] ieee80211 phy1: rt2x00lib_request_firmware: Info - Loading firmware file 'rt2870.bin'
[  348.364519] ieee80211 phy1: rt2x00lib_request_firmware: Info - Firmware detected - version: 0.36
[  348.650321] ieee80211 phy1: rt2x00usb_vendor_request: Error - Vendor Request 0x06 failed for offset 0x0404 with error -71
[  349.695576] ieee80211 phy1: rt2800_wait_csr_ready: Error - Unstable hardware
[  349.695606] ieee80211 phy1: rt2800usb_set_device_state: Error - Device failed to enter state 4 (-5)

which was the last error i got in my previous dump_stack too (which you linked):

2020-07-15T19:16:10.956602+0000 kernel: Call Trace:
2020-07-15T19:16:10.956620+0000 kernel:  dump_stack+0x64/0x88
2020-07-15T19:16:10.956635+0000 kernel: rt2x00usb_vendor_request.cold+0x2b/0x69 [rt2x00usb]
2020-07-15T19:16:10.956649+0000 kernel: rt2x00usb_vendor_req_buff_lock+0xa6/0x230 [rt2x00usb]
2020-07-15T19:16:10.956663+0000 kernel: rt2x00usb_register_write_lock+0x37/0x60 [rt2800usb]
2020-07-15T19:16:10.956677+0000 kernel: rt2800_mcu_request+0x100/0x110 [rt2800lib]
2020-07-15T19:16:10.956696+0000 kernel: rt2800_enable_radio+0xb6/0x2d36 [rt2800lib]
2020-07-15T19:16:10.956712+0000 kernel: rt2800usb_set_device_state+0xbd/0x18b [rt2800usb]
2020-07-15T19:16:10.956735+0000 kernel: rt2x00lib_enable_radio+0x3e/0xa0 [rt2x00lib]
2020-07-15T19:16:10.956754+0000 kernel:  rt2x00lib_start+0x7c/0xc0 [rt2x00lib]
2020-07-15T19:16:10.956778+0000 kernel:  drv_start+0x3e/0x130 [mac80211]

Anton "exuvo" Olsson
    exuvo@exuvo.se

On 2021-11-09 13:07, Stanislaw Gruszka wrote:
> On Tue, Nov 09, 2021 at 08:32:07AM +0100, Stanislaw Gruszka wrote:
>> On Mon, Nov 08, 2021 at 07:00:20PM +0100, Thorsten Leemhuis wrote:
>>> Sending this again, but this time also to Stanislaw's email address
>>> currently found in MAINTAINERS.
>>>
>>> Stanislaw, can you help with this regression?
>> Yes.
>>
>> I'll check on mail archives what is the status and what can be done.
> Ok, so what I can see here
> https://lore.kernel.org/linux-wireless/20211109073127.GA109212@wp.pl/T/#m6a677995c1afaf6b9b1ff19de9566f304089d3ac
> is that this problem happen only on firmware load,
> so I think we can use below patch as fix.
>
> Anton, please test it.
>
> Thanks
> Stanislaw
>
> diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c b/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
> index e4473a551241..57c947dad036 100644
> --- a/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
> +++ b/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
> @@ -30,7 +30,8 @@ static bool rt2x00usb_check_usb_error(struct rt2x00_dev *rt2x00dev, int status)
>   	else
>   		rt2x00dev->num_proto_errs = 0;
>   
> -	if (rt2x00dev->num_proto_errs > 3)
> +	if (rt2x00dev->num_proto_errs > 3 &&
> +	    !test_bit(DEVICE_STATE_STARTED, &rt2x00dev->flags))
>   		return true;
>   
>   	return false;
