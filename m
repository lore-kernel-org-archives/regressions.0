Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E561C1991A3
	for <regressions@lists.linux.dev>; Thu, 19 Sep 2024 11:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726747034; cv=none; b=Ar3zRFzkyJj6y6ZTaB6ZdjcLl+/OWIr57mmDZb8SuAGt53oBLTOcOkZVgZOAS/uvVAdRYUYRvkSboRFxmkBhxMLpwjNd38mPE5LAVFzsjNLuPPfPsLzTH541xBEMG6zWtn6hjWzTs/VXbx9oHrrUdB6crzm14hq3nWMgp1NRD1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726747034; c=relaxed/simple;
	bh=X09HiJbkHuu8NJQ/stb4oCZOST92Kw86iugzA3h1BwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=unQEyFz441ytEcdLpF12+tLjmY3o8ONZkkOMnfgo27DfXHqpklSKufdZwhTvv8g/mGzUIX01mrKDeznL95OsL+1OJqI48rCcNSIUDLVOx8XWmSpED89AP3sMpA+LHkRjlwRQ+0W9eVMGsaChzGtXAWMf8qeJH/trVHpDyDyG62A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=isoeIifD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="isoeIifD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726747031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OJEZdVr1TRYXeVyynBVpV/SQ3gp3Q8Ctb9jhD5iTUyE=;
	b=isoeIifDgUE0hJrIvrP3Gx2SpkxaVP3W1U97kuAGxnogITJ2UUftlqNLV/sUsJ5TLCSwQy
	7iwrcgDA8zho9xi4LIuLpDpyezxeWX8UAk+wAW6dzvXVrw8ymVKz2OJvQMcE5K9NBTZebG
	QIow/z6ic0hxJn0XMfthmbgIx2Qq5No=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-DXTrL86iPR6FcyRnNC4DsA-1; Thu, 19 Sep 2024 07:57:10 -0400
X-MC-Unique: DXTrL86iPR6FcyRnNC4DsA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a8a92ab4dd0so43542966b.1
        for <regressions@lists.linux.dev>; Thu, 19 Sep 2024 04:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726747029; x=1727351829;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VMtVCWKVVmEyhvCEKpScY7O+6/a/Rtk4FugRCP8H+l8=;
        b=vwazy+3nAu3D1bwI1gjMfU367n+LQ/uatw8HiYpicf/1WgJsRe/xepbP8uorRbA9Pp
         y4pEzuwkmmC+NxsCkFA2AOM7Vh+cVvMmcmLib1stMHaGCP/zO9PLifWhFKNdxdV23lmU
         IyX0enP8a2Z38PZv2djqEpaUwp/REApy/Jwmqy+Ie+2RTsres4ARIx+LEmNyGDiU0KL6
         jahH6Z5NA60X5Nu/DSDufyXEiRj1uNplPB1l+jZ13h/oWYAXFzvlFVNjdAP9NcNrR/PO
         aVOcxN/CGAEE/iGw3mY+I5sM+0bbupslB4QBwe5OaGL1iSsPx2A3NplGXf1EQ8O9v+D4
         Yrzg==
X-Forwarded-Encrypted: i=1; AJvYcCVAFUA3EQlofI5B4BCDL9O45ZpJS2E9dbky8Q3YRq6IJtY+d3NJ5EqXmO2WGd3W/UF9OlI8/sMjWI835A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHoT3dUyqYbRfggBSPLu0M1Sq+VU/cY9A+rZG1Vu5Zbdcikf1U
	vI9qQKirV5Nc/8s0y+yuZcHCn+dOhKxK5XhOQB2YCduDydZdlpP3nXMspFzslhC+VAZUEGKrShF
	73X648XkywXriM5HwQi6tACsqmtYvG3fRSH3o+HQXQQegSiC2R8pB2wonV2ez
X-Received: by 2002:a17:907:d3c5:b0:a8d:64af:dc2a with SMTP id a640c23a62f3a-a902947b903mr2356286666b.25.1726747029023;
        Thu, 19 Sep 2024 04:57:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3C35u+lkmgjJ7a+AyTN4jw4x5gVoRh7s/g56CQ7cdgCxYSb+2G/Ujl+9lLwypdxJhbDLdbQ==
X-Received: by 2002:a17:907:d3c5:b0:a8d:64af:dc2a with SMTP id a640c23a62f3a-a902947b903mr2356283766b.25.1726747028491;
        Thu, 19 Sep 2024 04:57:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a906109678fsm709977266b.30.2024.09.19.04.57.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Sep 2024 04:57:07 -0700 (PDT)
Message-ID: <aa60da75-7931-462d-addd-49adfbd9893b@redhat.com>
Date: Thu, 19 Sep 2024 13:57:07 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux fails to ACPI S3 supend on Dell XPS 13 9630
 (6.11.0-04557-g2f27fce67173)
To: Paul Menzel <pmenzel@molgen.mpg.de>, Marek Maslanka
 <mmaslanka@google.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
 regressions@lists.linux.dev, Petr Mladek <pmladek@suse.com>
References: <18784f62-91ff-4d88-9621-6c88eb0af2b5@molgen.mpg.de>
 <154114fb-276f-45f6-bba0-98133c7c5d4d@molgen.mpg.de>
 <3b600845-77d5-42d3-8556-53cc0b2eab25@molgen.mpg.de>
 <1c10c0c4-f4d7-490f-85d2-0278c062fb87@molgen.mpg.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1c10c0c4-f4d7-490f-85d2-0278c062fb87@molgen.mpg.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------r0lxKVxbcauw7w7YLuV0GqM0"
Content-Language: en-US, nl

This is a multi-part message in MIME format.
--------------r0lxKVxbcauw7w7YLuV0GqM0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 19-Sep-24 1:03 PM, Paul Menzel wrote:
> Dear Marek,
> 
> 
> Am 19.09.24 um 10:17 schrieb Paul Menzel:
> 
>> Am 19.09.24 um 07:51 schrieb Paul Menzel:
>>
>>> Am 19.09.24 um 07:51 schrieb Paul Menzel:
>>
>>>> On the Intel Kaby Lake laptop Dell XPS 13, Linux 6.11.0-04557- g2f27fce67173 (“6.12-rc0”) fails to ACPI S3 suspend the system. The screen turns black (as expected) and the power button LED stays on.
>>>>
>>>> Doing
>>>>
>>>>      echo N | sudo tee /sys/module/printk/parameters/console_suspend
>>>>
>>>> and on tty2
>>>>
>>>>      sudo systemctl stop gdm3
>>>>      sudo systemctl start getty@tty1.service
>>>>
>>>> and then on tty1
>>>>
>>>>      sudo systemctl suspend
>>>>
>>>> I see some panic messages and traces containing ktime_get or so, but I failed to save the messages. (Hints very much appreciated.)
>>>>
>>>> I try to test the printk changes, but otherwise bisecting is not feasible, as it’s my production machine.
>>
>> It’s not the printk changes. I tested some commits, and assume it’s the timer core changes:
>>
>>      $ git log --oneline --merges daa394f0f9d3c -3 --no-decorate
>>      daa394f0f9d3c Merge tag 'core-debugobjects-2024-09-16' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
>>      9ea925c806dbb Merge tag 'timers-core-2024-09-16' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
>>      cb69d86550b3f Merge tag 'irq-core-2024-09-16' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
>>
>>
>> 1.  6.11.0-02659-gcb69d86550b3 succeeds to ACPI S3 suspend
>> 2.  6.11.0-02710-gdaa394f0f9d3 fails to ACPI S3 suspend
> 
> It truns out your commit e86c8186d03a (platform/x86:intel/pmc: Enable the ACPI PM Timer to be turned off when suspended) causes the regression. The laptop defaults to s2idle, but due to problems, I force it to `deep`.
> 
> Revert on master is not easily possible due to other changes it seems.

First of all thank you for reporting this so early in the cycle and
for pinning it down to a specific commit. Both are really appreciated.

I guess that the power-savings from disabling the pm-timer are mostly
relevant for s0ix suspend. If regular S3 suspend is used the the
firmware is in control of the suspend and if necessary it should disable
the timer.

So I think we can fix this by limiting the new handling to s0ix suspend.

Can you please give the attached patch a try ?

Regards,

Hans

--------------r0lxKVxbcauw7w7YLuV0GqM0
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-platform-x86-intel-pmc-Leave-ACPI-PM-Timer-alone-whe.patch"
Content-Disposition: attachment;
 filename*0="0001-platform-x86-intel-pmc-Leave-ACPI-PM-Timer-alone-whe.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA3ODRkYjMxM2EyMWM4N2VlNDk5MDBhNGVmNDZjNzBkODViY2M2ZDk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgpE
YXRlOiBUaHUsIDE5IFNlcCAyMDI0IDEzOjUwOjU1ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gcGxh
dGZvcm0veDg2OmludGVsL3BtYzogTGVhdmUgQUNQSSBQTSBUaW1lciBhbG9uZSB3aGVuIHVzaW5n
CiBTMyBzdXNwZW5kCgpEaXNhYmxpbmcgdGhlIEFDUEkgUE0gdGltZXIgY2F1c2VzIHN1c3BlbmQg
dG8gbm8gbG9uZ2VyIHdvcmsgb24KYSBJbnRlbCBLYWJ5IExha2UgRGVsbCBYUFMgMTMgdXNpbmcg
ZGVlcCAvIFMzIHN1c3BlbmQuCgpUaGUgcG93ZXItc2F2aW5ncyBmcm9tIGRpc2FibGluZyB0aGUg
cG0tdGltZXIgYXJlIG1vc3RseSByZWxldmFudCBmb3IKczBpeCBzdXNwZW5kLiBJZiByZWd1bGFy
IFMzIHN1c3BlbmQgaXMgdXNlZCB0aGUgZmlybXdhcmUgaXMgaW4gY29udHJvbCBvZgp0aGUgc3Vz
cGVuZCBhbmQgaWYgbmVjZXNzYXJ5IGl0IHNob3VsZCBkaXNhYmxlIHRoZSB0aW1lciBpZiBuZWNl
c3NhcnkuCgpMaW1pdCB0aGUgZGlzYWJsaW5nIG9mIHRoZSBBQ1BJIFBNIFRpbWVyIG9uIHN1c3Bl
bmQgdG8gd2hlbiB1c2luZwpTMGl4IChzbyBub3QgZmlybXdhcmUsIGJ1dCBPUyBoYW5kbGVkKSBz
dXNwZW5kIHRvIGZpeCB0aGlzLgoKRml4ZXM6IGU4NmM4MTg2ZDAzYSAoInBsYXRmb3JtL3g4Njpp
bnRlbC9wbWM6IEVuYWJsZSB0aGUgQUNQSSBQTSBUaW1lciB0byBiZSB0dXJuZWQgb2ZmIHdoZW4g
c3VzcGVuZGVkIikKUmVwb3J0ZWQtYnk6IFBhdWwgTWVuemVsIDxwbWVuemVsQG1vbGdlbi5tcGcu
ZGU+CkNsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcG0vMTg3ODRmNjItOTFm
Zi00ZDg4LTk2MjEtNmM4OGViMGFmMmI1QG1vbGdlbi5tcGcuZGUvCkNjOiBNYXJlayBNYXNsYW5r
YSA8bW1hc2xhbmthQGdvb2dsZS5jb20+ClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhk
ZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvcG1jL2Nv
cmUuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3BtYy9jb3JlLmMgYi9kcml2ZXJzL3BsYXRm
b3JtL3g4Ni9pbnRlbC9wbWMvY29yZS5jCmluZGV4IGY0NDNiZjhiYjgyYy4uYzc1M2YwMTNiNTlk
IDEwMDY0NAotLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9wbWMvY29yZS5jCisrKyBi
L2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3BtYy9jb3JlLmMKQEAgLTEyNzUsNiArMTI3NSwx
MCBAQCBzdGF0aWMgdm9pZCBwbWNfY29yZV9hY3BpX3BtX3RpbWVyX3N1c3BlbmRfcmVzdW1lKHZv
aWQgKmRhdGEsIGJvb2wgc3VzcGVuZCkKIAlpZiAoIW1hcC0+YWNwaV9wbV90bXJfY3RsX29mZnNl
dCkKIAkJcmV0dXJuOwogCisJLyogQ2hlY2sgaWYgdGhlIHN1c3BlbmQgd2lsbCBhY3R1YWxseSB1
c2UgUzBpeCAqLworCWlmIChzdXNwZW5kICYmIHBtX3N1c3BlbmRfdmlhX2Zpcm13YXJlKCkpCisJ
CXJldHVybjsKKwogCWd1YXJkKG11dGV4KSgmcG1jZGV2LT5sb2NrKTsKIAogCWlmICghc3VzcGVu
ZCAmJiAhcG1jZGV2LT5lbmFibGVfYWNwaV9wbV90aW1lcl9vbl9yZXN1bWUpCi0tIAoyLjQ2LjAK
Cg==
--------------r0lxKVxbcauw7w7YLuV0GqM0--

