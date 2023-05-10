Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B2E20B4E
	for <regressions@lists.linux.dev>; Wed, 10 May 2023 10:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683713076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mxi0tssM/MIAC/Us8XUva2O6e9fov44nkm6fQlyWJnA=;
	b=B9/ZWLkKgz8obRLJxxxZ0rp8JeLEK257gW5Ud205VBuCK5jqHgB4sTfLB/TDfhchJ3rJ4H
	XvNeWJLfHA/0ksUFerQYo/fE4viEm40FEOECzBhjsj+ExAPAGW1cSg2Fbv8VD63Y+7r07J
	q+q04s0oJAgs7sUlctfaaycQaDc+mFI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-S5kx8tbmNxCO3931_QsEaA-1; Wed, 10 May 2023 06:04:35 -0400
X-MC-Unique: S5kx8tbmNxCO3931_QsEaA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-94a356c74e0so677512066b.2
        for <regressions@lists.linux.dev>; Wed, 10 May 2023 03:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683713074; x=1686305074;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mxi0tssM/MIAC/Us8XUva2O6e9fov44nkm6fQlyWJnA=;
        b=YoRsg8cfrgl4NxdkIoYyBiamE292u8s8CV0isWM+s+0j7Ubp6jjg1f5mXPlCLWCIW8
         dn7CHiV9EdrDhTzZgCwz0ep5jL4Uu0oUgzNpC/HlcgfrwYN/R9Rjp5B+anUCAj7kIynW
         E/fke1VCtkY2DDjOw7LnejMzNkyNlVLvOnMYsCPkNxhErpeizKuUIRNJapv+DJ/N/BZG
         aDkeY9dbtDaIoB5TNkjMmbUoL2QURCR+2IQ0EyYbPhJvbh0m5MgEM4pzhYDfy1NcusQW
         Db8IvT0LoQxUxJupP8iqRvnXDS3PFzLSnj1wMBDo+lUJJERpOZ2o8WugBfIbh0sb+R5V
         qZ3w==
X-Gm-Message-State: AC+VfDzzVsC6NQZOUbJuQ0py+poWNKfmKwbyh07OIXuQ1rFq6VSDNbJh
	H69j1/LBbAXZ+Xo6reg1ieIXCnaQ1qhIBxBKyl/ubIA5t469tDj03FOLZDARFsncTI+7v9JH3Zw
	A0qKH/vFwPw4PxwcExoxAH7A=
X-Received: by 2002:a17:906:dc93:b0:94f:a292:20cc with SMTP id cs19-20020a170906dc9300b0094fa29220ccmr15643201ejc.41.1683713074311;
        Wed, 10 May 2023 03:04:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6g3VLlchZ4NQ4dVKKV7VFeDXbAdsULvGoTQhQBYH7wgUiWDxOc+E6cOLAsZqVz3BCBbS6/Sw==
X-Received: by 2002:a17:906:dc93:b0:94f:a292:20cc with SMTP id cs19-20020a170906dc9300b0094fa29220ccmr15643186ejc.41.1683713074026;
        Wed, 10 May 2023 03:04:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id de25-20020a1709069bd900b0096664376ec9sm2486973ejc.55.2023.05.10.03.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 03:04:33 -0700 (PDT)
Message-ID: <c7aa9034-59f8-11aa-7170-86c0db012dda@redhat.com>
Date: Wed, 10 May 2023 12:04:32 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [REGRESSION] wifi: brcmfmac: add firmware vendor info in driver
 info
To: Felix <nimrod4garoa@gmail.com>, Arend van Spriel <aspriel@gmail.com>,
 Franky Lin <franky.lin@broadcom.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>
Cc: regressions@lists.linux.dev,
 Arend van Spriel <arend.vanspriel@broadcom.com>,
 Kalle Valo <kvalo@kernel.org>, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 SHA-cyfmac-dev-list@infineon.com
References: <4ef3f252ff530cbfa336f5a0d80710020fc5cb1e.camel@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <4ef3f252ff530cbfa336f5a0d80710020fc5cb1e.camel@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Felix,

On 5/10/23 10:25, Felix wrote:
> Changes made by the mentioned commit lead to Oops when waking up after
> suspend to RAM.
> 
> When waking up a Dell XPS 13 9350 with BCM4350 wifi card after suspend
> to RAM, the kernel hangs with a NULL pointer dereference and Oops. The
> issues was introduced by commit
> da6d9c8ecd00e20218461007948f2b0a8e7fa242 and only happens when the
> brcmfmac module is loaded. This issue is the reason we could not
> upgrade to newer kernels than the 6.1 series on the affected machine.
> 
> 
> Details:
> 
> On a Dell XPS 13 9350 laptop with Broadcom BCM4350 wifi card (according
> to lspci), every kernel starting with 6.2 hangs when waking up after
> suspend to RAM. The issue persisted as of May 2nd (last tested commit
> was 348551ddaf311c76b01cdcbaf61b6fef06a49144). Passing the debug and
> no_console_suspend parameters to the kernel show that a NULL pointer
> dereference and an Oops happen at wakeup. Please find the kernel
> messages readable on the screen at this point attached
> (kernel_log_after_suspend.txt).
> 
> A bisection was successful and produced the first bad commit
> [da6d9c8ecd00e20218461007948f2b0a8e7fa242] wifi: brcmfmac: add firmware
> vendor info in driver info
> I've attached the bisection log as well (bisect.txt).
> 
> Suspend to RAM works on this machine on newer kernels once the brcmfmac
> module is unloaded.
> 
> Distribution: Arch Linux
> Architecture: x86_64
> Device: Dell XPS 13 9350 with BCM4350 wifi card
> Kernel config used at compilation (created using the Arch Linux default
> config and make olddefconfig):
> https://gist.githubusercontent.com/maclomhair/e33fa7eece8f8c77e5a88c4eede2f523/raw/429dfb022498c026225865dbb3ab2f75d5030a54/config
> Dmesg output after boot:
> https://gist.githubusercontent.com/maclomhair/47c75fa759d93800e7fb5e937fabef3e/raw/10750996a1ea9dcb3fa14d9b94e11fedd3abf280/dmesg
> 
> #regzbot introduced da6d9c8ecd00e20218461007948f2b0a8e7fa242

Thank you for reporting this and thank you for bisecting it too!

As a result of your excellent bug report I've been able to write
a fix for this. I'm confident enough in the fix that I've submitted
it upstream right away.

But it would still be good if you can test the fix and let us know
if it fixes this issue for you. You should have received a copy
of the patch when I submitted it upstream.

Regards,

Hans




