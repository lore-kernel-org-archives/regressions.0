Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4EE8C09
	for <regressions@lists.linux.dev>; Mon,  9 Jan 2023 19:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673291995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+axg1bTfYYWe3L1sDAB+vo+pJO3doVTWhPxeGjslgSM=;
	b=fIiuZy5eJINYzUkgD4DZdbiovsfNla2dRSvFlw3Om5PMD0RaTd+g5z7rOaDJdIC9Fe46FE
	KV19OX8BinarZGemDyWeJarc0IorhdJTz8zP267LnjHLM6MbAEPkfmDlecCF3FnOwmZA1k
	wU86FPuLuqyMWN4r76GlAx+FP8EAJIk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-333-zvg2ESdZOm6rBpLghXn5yA-1; Mon, 09 Jan 2023 14:19:54 -0500
X-MC-Unique: zvg2ESdZOm6rBpLghXn5yA-1
Received: by mail-ej1-f72.google.com with SMTP id ga21-20020a1709070c1500b007c171be7cd7so6160803ejc.20
        for <regressions@lists.linux.dev>; Mon, 09 Jan 2023 11:19:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mFltw65yU5wYb2CI37wztdEBX5JLU/nFwyKtALWd1AM=;
        b=Z5uXBWEdCzgr7DzkxcJNxYjiAyx5bZNSITU6I/0+RU8cfaasjWEc/LNqipE9e4IhI+
         ZMBRGo77yTzPEMK8Wv8ruOeMZ10QWMdcZuPhXBbdtYGlmEQRV8tUBX9eZYadCG/nN8G1
         R3FOp5D6SpJ0Dt7jMQqPzRhdkywqV9kyaUOo4M9uHyYwxxzoqb0d58IfEnSDRd7PSxkX
         Xf+ZB1TC8/5QC48ra0Sgrqozmzz3PscbyoNOB2QjNXsvqYiRbdqStWTk9nT6AqtsKeyS
         x9n6VyMSpgL1xHRIEkNC93BCsEUnSLapwAF1iGAW+hLsfjN/LSq2kuQI5RmcgXrYzkHS
         jqsA==
X-Gm-Message-State: AFqh2kqK7IFHQKNP7QT+Qtoo/X+gSSBUJbH6o5QgcKXTSsjP5joF8IFi
	bKToEN4VlaeOlVg7RKCgKH5uFoNlnWTRlcseBmNCxLU6sTMzrUBDDlP5SigBq53HWcljd/xedHq
	qFP3nEGL7XWY48RCiEWoYxDc=
X-Received: by 2002:a17:906:2854:b0:7c0:e30a:d3e5 with SMTP id s20-20020a170906285400b007c0e30ad3e5mr52949219ejc.18.1673291992595;
        Mon, 09 Jan 2023 11:19:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv1ptdcKRUvgtkGwSm5aN8gvshRH26R3CYC0LEC5fuyUWbVzxUzIipF5QDqgM43CGN8aHZMMw==
X-Received: by 2002:a17:906:2854:b0:7c0:e30a:d3e5 with SMTP id s20-20020a170906285400b007c0e30ad3e5mr52949212ejc.18.1673291992414;
        Mon, 09 Jan 2023 11:19:52 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 11-20020a170906318b00b0078d3f96d293sm4091704ejy.30.2023.01.09.11.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 11:19:51 -0800 (PST)
Message-ID: <166f50f5-6034-d644-86ed-c41a8636263a@redhat.com>
Date: Mon, 9 Jan 2023 20:19:50 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
To: Youssef Aly <youssefaswad@gmail.com>, Daniel Dadap <ddadap@nvidia.com>
Cc: regressions <regressions@lists.linux.dev>
References: <CAKsK3AkWhAx6cvt5ABRecun+24FVQa441OrYfzYQ5fJpJHCqmw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAKsK3AkWhAx6cvt5ABRecun+24FVQa441OrYfzYQ5fJpJHCqmw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------nYu4fmO8K4MzXBXwiJBT0KXf"
Content-Language: en-US, nl

This is a multi-part message in MIME format.
--------------nYu4fmO8K4MzXBXwiJBT0KXf
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Youssef,

On 1/9/23 17:18, Youssef Aly wrote:
> Hello,
> 
> The backlight control has been broken on Dell G15 5515 since 6.1, it
> is always at full brightness, this is only the case in hybrid (mux)
> graphics mode.
> 
> As per the output of lsmod the nvidia_wmi_ec_backlight is loaded:
> nvidia_wmi_ec_backlight    16384  0
> video                  61440  5
> nvidia_wmi_ec_backlight,dell_wmi,amdgpu,dell_laptop,nvidia_modeset
> wmi                    36864  7
> video,nvidia_wmi_ec_backlight,alienware_wmi,dell_wmi,wmi_bmof,dell_smbios,dell_wmi_descriptor
> 
> but it is not present in /sys/class/backlight, only amdgpu_bl1 is
> present which is not functional
> contents of /sys/class/backlight
> total 0
> lrwxrwxrwx 1 root root 0 Jan  9 00:49 amdgpu_bl1 ->
> ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
> 
> this is the content on 6.0.12
> total 0
> lrwxrwxrwx 1 root root 0 Jan  8 20:59 amdgpu_bl1 ->
> ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
> lrwxrwxrwx 1 root root 0 Jan  8 20:59 nvidia_wmi_ec_backlight ->
> ../../devices/pci0000:00/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/603E9613-EF25-4338-A3D0-C46177516DB7/backlight/nvidia_wmi_ec_backlight/
> 
> Distro: Endeavour OS
> Kernel: 6.1.4-arch1-1
> GPU: RTX 3060 Using nvidia proprietary drivers version 525.78.01
> 
> #regzbot introduced v6.1..v6.1.4

Hmm, this is likely caused by:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f46acc1efd4b5846de9fa05f966e504f328f34a6

Which was added because according to the reporter on their G15 5515
backlight control only works in native mode ...

I'm getting the feeling that we need to detect the BIOS setting
and use a different backlight device depending on the setting...

Daniel, any ideas?

For now can you try building a kernel with the attached patch
(which I've also just submitted upstream) and with:

acpi_backlight=nvidia_wmi_ec

added to your kernel commandline. That should work around this
for now...

Regards,

Hans

--------------nYu4fmO8K4MzXBXwiJBT0KXf
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-ACPI-video-Allow-selecting-NVidia-WMI-EC-or-Apple-GM.patch"
Content-Disposition: attachment;
 filename*0="0001-ACPI-video-Allow-selecting-NVidia-WMI-EC-or-Apple-GM.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBjMmZhYmU0MGMyMDg4ZWNjMWMzZDE1MDBkZjU5MWRlZGU1NjcxMTU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgpE
YXRlOiBNb24sIDkgSmFuIDIwMjMgMTk6NTg6MzggKzAxMDAKU3ViamVjdDogW1BBVENIXSBBQ1BJ
OiB2aWRlbzogQWxsb3cgc2VsZWN0aW5nIE5WaWRpYS1XTUktRUMgb3IgQXBwbGUgR01VWAogYmFj
a2xpZ2h0IGZyb20gdGhlIGNtZGxpbmUKClRoZSBwYXRjaGVzIGFkZGluZyBOVmlkaWEtV01JLUVD
IGFuZCBBcHBsZSBHTVVYIGJhY2tsaWdodCBkZXRlY3Rpb24Kc3VwcG9ydCB0byBhY3BpX3ZpZGVv
X2dldF9iYWNrbGlnaHRfdHlwZSgpLCBmb3Jnb3QgdG8gdXBkYXRlCmFjcGlfdmlkZW9fcGFyc2Vf
Y21kbGluZSgpIHRvIGFsbG93IG1hbnVhbGx5IHNlbGVjdGluZyB0aGVzZSBmcm9tCnRoZSBjb21t
YW5kbGluZS4KCkFkZCBzdXBwb3J0IGZvciB0aGVzZSB0byBhY3BpX3ZpZGVvX3BhcnNlX2NtZGxp
bmUoKS4KCkZpeGVzOiBmZTdhZWJiNDBkNDIgKCJBQ1BJOiB2aWRlbzogQWRkIE52aWRpYSBXTUkg
RUMgYnJpZ2h0bmVzcyBjb250cm9sIGRldGVjdGlvbiAodjMpIikKRml4ZXM6IDIxMjQ1ZGYzMDdj
YiAoIkFDUEk6IHZpZGVvOiBBZGQgQXBwbGUgR01VWCBicmlnaHRuZXNzIGNvbnRyb2wgZGV0ZWN0
aW9uIikKU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4K
LS0tCiBkcml2ZXJzL2FjcGkvdmlkZW9fZGV0ZWN0LmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvdmlkZW9fZGV0ZWN0
LmMgYi9kcml2ZXJzL2FjcGkvdmlkZW9fZGV0ZWN0LmMKaW5kZXggMWI3OGM3NDM0NDkyLi44YTU0
MWVmYzU2NzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYWNwaS92aWRlb19kZXRlY3QuYworKysgYi9k
cml2ZXJzL2FjcGkvdmlkZW9fZGV0ZWN0LmMKQEAgLTUwLDYgKzUwLDEwIEBAIHN0YXRpYyB2b2lk
IGFjcGlfdmlkZW9fcGFyc2VfY21kbGluZSh2b2lkKQogCQlhY3BpX2JhY2tsaWdodF9jbWRsaW5l
ID0gYWNwaV9iYWNrbGlnaHRfdmlkZW87CiAJaWYgKCFzdHJjbXAoIm5hdGl2ZSIsIGFjcGlfdmlk
ZW9fYmFja2xpZ2h0X3N0cmluZykpCiAJCWFjcGlfYmFja2xpZ2h0X2NtZGxpbmUgPSBhY3BpX2Jh
Y2tsaWdodF9uYXRpdmU7CisJaWYgKCFzdHJjbXAoIm52aWRpYV93bWlfZWMiLCBhY3BpX3ZpZGVv
X2JhY2tsaWdodF9zdHJpbmcpKQorCQlhY3BpX2JhY2tsaWdodF9jbWRsaW5lID0gYWNwaV9iYWNr
bGlnaHRfbnZpZGlhX3dtaV9lYzsKKwlpZiAoIXN0cmNtcCgiYXBwbGVfZ211eCIsIGFjcGlfdmlk
ZW9fYmFja2xpZ2h0X3N0cmluZykpCisJCWFjcGlfYmFja2xpZ2h0X2NtZGxpbmUgPSBhY3BpX2Jh
Y2tsaWdodF9hcHBsZV9nbXV4OwogCWlmICghc3RyY21wKCJub25lIiwgYWNwaV92aWRlb19iYWNr
bGlnaHRfc3RyaW5nKSkKIAkJYWNwaV9iYWNrbGlnaHRfY21kbGluZSA9IGFjcGlfYmFja2xpZ2h0
X25vbmU7CiB9Ci0tIAoyLjM5LjAKCg==
--------------nYu4fmO8K4MzXBXwiJBT0KXf--

