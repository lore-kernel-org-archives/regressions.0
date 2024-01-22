Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D213CF7D
	for <regressions@lists.linux.dev>; Mon, 22 Jan 2024 13:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705930995; cv=none; b=oFgQH3TIEomWVwWRUbdh2TtfuVadNgWf+d3x9OCKebhvoCoEFcR3Hd/GOz2aGHjJ2VlOr6jLr/L7fdWcVt89qG4d7ExCoQwz/PHTy5MCK/zxfxCRS4zDBl5PHkdUIjpY95zK78xnSsMcZEC9ps7eEfOe91Og25GGb9oJWwd2YRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705930995; c=relaxed/simple;
	bh=6/y6dVqX3tc9rLYX+TMVyibYRWAr5HjDwQmR7zqMaq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lVxXzh00UUdxjMxL/+iaOayYcwn88UJgC+QO3PBnUWXJi24z0ZzYwfs7yw3A7g/hslnZJQJi8hcTMbnVKcXN26x+2pwdmVjnUXAEUS1F/YHExGFCL4jDqIZvhA2Rp+ix50DIiRkptjgsq9nAC/R8GHLzSOghVr92h3CJE54m4PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gV1/eF1A; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gV1/eF1A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705930992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FgQPXZ+D3Z2iz2l7Xjzno1KykKLc8jY3c5Lm2INalIg=;
	b=gV1/eF1AcN5t5PiT/HEqfwbJ+ZIZuezKkvR3pAqhuD8riYiaEuFdIdUIcZU/ucfRsZaDxv
	IDmXlR0akYALjkelm7LRPQC1bVJ0bBcSXFZSK2IgPNjCHsPYtY4nOwHCBRUQQfCrAemCAt
	zN6B2bvlJeu74N6Mr1O2WZcbk8copF4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-VNO9ykJ1Ny-BoAkR3bmpmw-1; Mon, 22 Jan 2024 08:43:08 -0500
X-MC-Unique: VNO9ykJ1Ny-BoAkR3bmpmw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-40e53200380so28473835e9.3
        for <regressions@lists.linux.dev>; Mon, 22 Jan 2024 05:43:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705930987; x=1706535787;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hm05vtFJz6C1MRHFDEJ+QgrtImKj2pXIVFR7juPcnoQ=;
        b=q/mjPbBkPihIQyFp2uCZTzpHMTw6sZokoCssa4MEob7Vmsxkt/Ti6Jnkca404lf+9e
         9mj8LFSHLUqLUJ6021Hy6m23JXddhkd5fuWlHnAxiGiyMO/m9sui7WM8a8XJv7Nu5jY/
         tjchcRqEUrZri0R9NIFnWYx2FQejj5GKsf2/BdXIJbnWbFPu70+H4dLJFQyjV9B6gtr9
         p9MlhR7RQPg2/guuxLmzW8CjdsbTuEHCMLbkcLvbKq1rZOdAtQop01Z+Wx4zkSYWM/1e
         aW/SxCnbgD0kFL46jK6fj0ZbZGInBCfy4OMwvfE1iRF/vn13VKKXjWVoiJwbrptiyHbb
         XkSA==
X-Gm-Message-State: AOJu0YwCq8kJC10dMR9GdhOmG0U8T/5ewKHdAPr6HGm+sUghU5JKlBJe
	d4oEx2b3WUgRxEi2TdaVh8ANC4AAgMtF5zoTx4JGdaO4lzuoT67DRK0QkJpkTwV1byLTIwj6MZY
	qgGaUF8gIY1HOdxEJpHPaqWNljf2uSK4ILKExzSR6Y55C8O+dmAGDHkj8nbfRXkTYXbLQ
X-Received: by 2002:a05:600c:2991:b0:40e:5496:281 with SMTP id r17-20020a05600c299100b0040e54960281mr2367054wmd.67.1705930987481;
        Mon, 22 Jan 2024 05:43:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBjufMAwCjjBbigsvKysfHmzef2ySdfMYb2Bf52L/eKzNLuX8VX8/k7MZlVuc+pjxt6AB8qQ==
X-Received: by 2002:a05:600c:2991:b0:40e:5496:281 with SMTP id r17-20020a05600c299100b0040e54960281mr2367040wmd.67.1705930987119;
        Mon, 22 Jan 2024 05:43:07 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n5-20020a056402434500b00559c6000835sm7496700edc.5.2024.01.22.05.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 05:43:06 -0800 (PST)
Message-ID: <dde1bdfe-7877-41bd-b233-03bcdba0e2de@redhat.com>
Date: Mon, 22 Jan 2024 14:43:05 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PS/2 keyboard of laptop Dell XPS 13 9360 goes missing after S3
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-input@vger.kernel.org, linux-pm@vger.kernel.org,
 Dell.Client.Kernel@dell.com, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <0aa4a61f-c939-46fe-a572-08022e8931c7@molgen.mpg.de>
 <f27b491c-2f1c-4e68-804c-24eeaa8d10de@redhat.com>
 <0b30c88a-6f0c-447f-a08e-29a2a0256c1b@molgen.mpg.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0b30c88a-6f0c-447f-a08e-29a2a0256c1b@molgen.mpg.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------3AfAKs2b0Kmg9oZsVXU3SqQo"
Content-Language: en-US, nl

This is a multi-part message in MIME format.
--------------3AfAKs2b0Kmg9oZsVXU3SqQo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Paul,

On 1/21/24 15:26, Paul Menzel wrote:
> Dear Hans,
> 
> 
> As always thank you very much for taking the time to reply.
> 
> 
> Am 20.01.24 um 21:26 schrieb Hans de Goede:
> 
>> On 1/18/24 13:57, Paul Menzel wrote:
>>> #regzbot introduced v6.6.11..v6.7
> 
>>> There seems to be a regression in Linux 6.7 on the Dell XPS 13 9360 (Intel i7-7500U).
>>>
>>>      [    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022
>>>
>>> The PS/2 keyboard goes missing after S3 resume¹. The problem does not happen with Linux 6.6.11.
>>
>> Thank you for reporting this.
>>
>> Can you try adding "i8042.dumbkbd=1" to your kernel commandline?
>>
>> This should at least lead to the device not disappearing from
>>
>> "sudo libinput list-devices"
>>
>> The next question is if the keyboard will still actually
>> work after suspend/resume with "i8042.dumbkbd=1". If it
>> stays in the list, but no longer works then there is
>> a problem with the i8042 controller; or interrupt
>> delivery to the i8042 controller.
>>
>> If "i8042.dumbkbd=1" somehow fully fixes things, then I guess
>> my atkbd driver fix for other laptop keyboards is somehow
>> causing issues for yours.
> 
> Just a quick feedback, that booting with `i8042.dumbkbd=1` seems to fix the issue.
> 
>> If "i8042.dumbkbd=1" fully fixes things, can you try building
>> your own 6.7.0 kernel with commit 936e4d49ecbc:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=936e4d49ecbc8c404790504386e1422b599dec39
>>
>> reverted?
> 
> I am going to try that as soon as possible.

Assuming this was not some one time glitch with 6.7.0,
I have prepared a patch hopefully fixing this (1) as well
as a follow up fix to address another potential issue which
I have noticed.

Can you please give a 6.7.0 (2) kernel with the 2 attached
patches added a try ?

I know building kernels can be a bit of work / takes time,
sorry. If you are short on time I would prefer testing these 2
patches and see if they fix things over trying a plain revert.

Regards,

Hans



1) Assuming it is caused by this commit in the first place,
which seems likely

2) 6.8-rc1 has a follow up patch which is squashed into the
first patch here, so these patches will only apply cleanly
to 6.7.0 .





>>>      [    1.435071] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
>>>      [    1.435409] i8042: Warning: Keylock active
>>>      [    1.437624] serio: i8042 KBD port at 0x60,0x64 irq 1
>>>      [    1.437631] serio: i8042 AUX port at 0x60,0x64 irq 12
>>>      […]
>>>      [    1.439743] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
>>>
>>>      $ sudo libinput list-devices
>>>      […]
>>>      Device:           AT Translated Set 2 keyboard
>>>      Kernel:           /dev/input/event0
>>>      Group:            15
>>>      Seat:             seat0, default
>>>      Capabilities:     keyboard
>>>      Tap-to-click:     n/a
>>>      Tap-and-drag:     n/a
>>>      Tap drag lock:    n/a
>>>      Left-handed:      n/a
>>>      Nat.scrolling:    n/a
>>>      Middle emulation: n/a
>>>      Calibration:      n/a
>>>      Scroll methods:   none
>>>      Click methods:    none
>>>      Disable-w-typing: n/a
>>>      Disable-w-trackpointing: n/a
>>>      Accel profiles:   n/a
>>>      Rotation:         0.0
>>>
>>> `libinput list-devices` does not list the device after resuming
>>> from S3. Some of the function keys, like brightness and airplane
>>> mode keys, still work, as the events are probably transmitted over
>>> the embedded controller or some other mechanism. An external USB
>>> keyboard also still works.
>>>
>>> I haven’t had time to further analyze this, but wanted to report
>>> it. No idea
>>>
>>>
>>> Kind regards,
>>>
>>> Paul
>>>
>>>
>>> ¹ s2idle is not working correctly on the device, in the sense, that
>>> energy usage is very high in that state, and the full battery is at
>>> 20 % after leaving it for eight hours.
> 

--------------3AfAKs2b0Kmg9oZsVXU3SqQo
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-Input-atkbd-Skip-ATKBD_CMD_SETLEDS-when-skipping-ATK.patch"
Content-Disposition: attachment;
 filename*0="0001-Input-atkbd-Skip-ATKBD_CMD_SETLEDS-when-skipping-ATK.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAwNjdmODllMzQyNjQ2MTdkZDIyYjBjYjg1MGM3OTk2YzkzMTUyY2QxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgpE
YXRlOiBUdWUsIDE2IEphbiAyMDI0IDIxOjQzOjI1ICswMTAwClN1YmplY3Q6IFtQQVRDSCAxLzJd
IElucHV0OiBhdGtiZCAtIFNraXAgQVRLQkRfQ01EX1NFVExFRFMgd2hlbiBza2lwcGluZwogQVRL
QkRfQ01EX0dFVElECgpBZnRlciBjb21taXQgOTM2ZTRkNDllY2JjICgiSW5wdXQ6IGF0a2JkIC0g
c2tpcCBBVEtCRF9DTURfR0VUSUQgaW4KdHJhbnNsYXRlZCBtb2RlIikgdGhlIGtleWJvYXJkIG9u
IGEgRGVsbCBYUFMgMTMgOTM2MCBoYXMgc3RvcHBlZAp3b3JraW5nIGFmdGVyIGEgc3VzcGVuZC9y
ZXN1bWUuCgpUaGUgcHJvYmxlbSBhcHBlYXJzIHRvIGJlIHRoYXQgYXRrYmRfcHJvYmUoKSBmYWls
cyB3aGVuIGNhbGxlZApmcm9tIGF0a2JkX3JlY29ubmVjdCgpIG9uIHJlc3VtZSwgd2hpY2ggb24g
c3lzdGVtcyB3aGVyZQpBVEtCRF9DTURfR0VUSUQgaXMgc2tpcHBlZCBjYW4gb25seSBoYXBwZW4g
YnkgQVRLQkRfQ01EX1NFVExFRFMKZmFpbGluZy4gQVRLQkRfQ01EX1NFVExFRFMgZmFpbGluZyBi
ZWNhdXNlIEFUS0JEX0NNRF9HRVRJRCB3YXMKc2tpcHBlZCBpcyB3ZWlyZCwgYnV0IGFwcGFyZW50
bHkgdGhhdCBpcyB3aGF0IGlzIGhhcHBlbmluZy4KCkZpeCB0aGlzIGJ5IGFsc28gc2tpcHBpbmcg
QVRLQkRfQ01EX1NFVExFRFMgd2hlbiBza2lwcGluZwpBVEtCRF9DTURfR0VUSUQuCgpGaXhlczog
OTM2ZTRkNDllY2JjICgiSW5wdXQ6IGF0a2JkIC0gc2tpcCBBVEtCRF9DTURfR0VUSUQgaW4gdHJh
bnNsYXRlZCBtb2RlIikKUmVwb3J0ZWQtYnk6IFBhdWwgTWVuemVsIDxwbWVuemVsQG1vbGdlbi5t
cGcuZGU+CkNsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaW5wdXQvMGFhNGE2
MWYtYzkzOS00NmZlLWE1NzItMDgwMjJlODkzMWM3QG1vbGdlbi5tcGcuZGUvCkNjOiBzdGFibGVA
dmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJl
ZGhhdC5jb20+Ci0tLQogZHJpdmVycy9pbnB1dC9rZXlib2FyZC9hdGtiZC5jIHwgMTUgKysrKysr
KysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L2tleWJvYXJkL2F0a2JkLmMgYi9kcml2ZXJz
L2lucHV0L2tleWJvYXJkL2F0a2JkLmMKaW5kZXggNzg2ZjAwZjZiN2ZkLi5jMjI5YmQ2YjNmN2Yg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW5wdXQva2V5Ym9hcmQvYXRrYmQuYworKysgYi9kcml2ZXJz
L2lucHV0L2tleWJvYXJkL2F0a2JkLmMKQEAgLTc5MSw5ICs3OTEsOSBAQCBzdGF0aWMgYm9vbCBh
dGtiZF9pc19wb3J0YWJsZV9kZXZpY2Uodm9pZCkKICAqIG5vdCB3b3JrLiBTbyBpbiB0aGlzIGNh
c2Ugc2ltcGx5IGFzc3VtZSBhIGtleWJvYXJkIGlzIGNvbm5lY3RlZCB0byBhdm9pZAogICogY29u
ZnVzaW5nIHNvbWUgbGFwdG9wIGtleWJvYXJkcy4KICAqCi0gKiBTa2lwcGluZyBBVEtCRF9DTURf
R0VUSUQgZW5kcyB1cCB1c2luZyBhIGZha2Uga2V5Ym9hcmQgaWQuIFVzaW5nIGEgZmFrZSBpZCBp
cwotICogb2sgaW4gdHJhbnNsYXRlZCBtb2RlLCBvbmx5IGF0a2JkX3NlbGVjdF9zZXQoKSBjaGVj
a3MgYXRrYmQtPmlkIGFuZCBpbgotICogdHJhbnNsYXRlZCBtb2RlIHRoYXQgaXMgYSBuby1vcC4K
KyAqIFNraXBwaW5nIEFUS0JEX0NNRF9HRVRJRCBlbmRzIHVwIHVzaW5nIGEgZmFrZSBrZXlib2Fy
ZCBpZC4gVXNpbmcgdGhlIHN0YW5kYXJkCisgKiAweGFiODMgaWQgaXMgb2sgaW4gdHJhbnNsYXRl
ZCBtb2RlLCBvbmx5IGF0a2JkX3NlbGVjdF9zZXQoKSBjaGVja3MgYXRrYmQtPmlkCisgKiBhbmQg
aW4gdHJhbnNsYXRlZCBtb2RlIHRoYXQgaXMgYSBuby1vcC4KICAqLwogc3RhdGljIGJvb2wgYXRr
YmRfc2tpcF9nZXRpZChzdHJ1Y3QgYXRrYmQgKmF0a2JkKQogewpAQCAtODI0LDYgKzgyNCwxMSBA
QCBzdGF0aWMgaW50IGF0a2JkX3Byb2JlKHN0cnVjdCBhdGtiZCAqYXRrYmQpCiAJCQkJICJrZXli
b2FyZCByZXNldCBmYWlsZWQgb24gJXNcbiIsCiAJCQkJIHBzMmRldi0+c2VyaW8tPnBoeXMpOwog
CisJaWYgKGF0a2JkX3NraXBfZ2V0aWQoYXRrYmQpKSB7CisJCWF0a2JkLT5pZCA9IDB4YWI4MzsK
KwkJcmV0dXJuIDA7CisJfQorCiAvKgogICogVGhlbiB3ZSBjaGVjayB0aGUga2V5Ym9hcmQgSUQu
IFdlIHNob3VsZCBnZXQgMHhhYjgzIHVuZGVyIG5vcm1hbCBjb25kaXRpb25zLgogICogU29tZSBr
ZXlib2FyZHMgcmVwb3J0IGRpZmZlcmVudCB2YWx1ZXMsIGJ1dCB0aGUgZmlyc3QgYnl0ZSBpcyBh
bHdheXMgMHhhYiBvcgpAQCAtODMyLDEwICs4MzcsMTAgQEAgc3RhdGljIGludCBhdGtiZF9wcm9i
ZShzdHJ1Y3QgYXRrYmQgKmF0a2JkKQogICovCiAKIAlwYXJhbVswXSA9IHBhcmFtWzFdID0gMHhh
NTsJLyogaW5pdGlhbGl6ZSB3aXRoIGludmFsaWQgdmFsdWVzICovCi0JaWYgKGF0a2JkX3NraXBf
Z2V0aWQoYXRrYmQpIHx8IHBzMl9jb21tYW5kKHBzMmRldiwgcGFyYW0sIEFUS0JEX0NNRF9HRVRJ
RCkpIHsKKwlpZiAocHMyX2NvbW1hbmQocHMyZGV2LCBwYXJhbSwgQVRLQkRfQ01EX0dFVElEKSkg
ewogCiAvKgotICogSWYgdGhlIGdldCBJRCBjb21tYW5kIHdhcyBza2lwcGVkIG9yIGZhaWxlZCwg
d2UgY2hlY2sgaWYgd2UgY2FuIGF0IGxlYXN0IHNldAorICogSWYgdGhlIGdldCBJRCBjb21tYW5k
IGZhaWxlZCwgd2UgY2hlY2sgaWYgd2UgY2FuIGF0IGxlYXN0IHNldAogICogdGhlIExFRHMgb24g
dGhlIGtleWJvYXJkLiBUaGlzIHNob3VsZCB3b3JrIG9uIGV2ZXJ5IGtleWJvYXJkIG91dCB0aGVy
ZS4KICAqIEl0IGFsc28gdHVybnMgdGhlIExFRHMgb2ZmLCB3aGljaCB3ZSB3YW50IGFueXdheS4K
ICAqLwotLSAKMi40My4wCgo=
--------------3AfAKs2b0Kmg9oZsVXU3SqQo
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-Input-atkbd-Do-not-skip-atkbd_deactivate-when-skippi.patch"
Content-Disposition: attachment;
 filename*0="0002-Input-atkbd-Do-not-skip-atkbd_deactivate-when-skippi.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBiYjY0MzViYWVhNTJmNjZlN2FhY2E0MzUyMGJkYjFmNzFhMTgxYTVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgpE
YXRlOiBNb24sIDIyIEphbiAyMDI0IDE0OjMyOjE2ICswMTAwClN1YmplY3Q6IFtQQVRDSCAyLzJd
IElucHV0OiBhdGtiZCAtIERvIG5vdCBza2lwIGF0a2JkX2RlYWN0aXZhdGUoKSB3aGVuCiBza2lw
cGluZyBBVEtCRF9DTURfR0VUSUQKCkFmdGVyIGNvbW1pdCA5MzZlNGQ0OWVjYmMgKCJJbnB1dDog
YXRrYmQgLSBza2lwIEFUS0JEX0NNRF9HRVRJRCBpbgp0cmFuc2xhdGVkIG1vZGUiKSBub3Qgb25s
eSB0aGUgZ2V0aWQgY29tbWFuZCBpcyBza2lwcGVkLCBidXQgYWxzbwp0aGUgZGUtYWN0aXZhdGlu
ZyBvZiB0aGUga2V5Ym9hcmQgYXQgdGhlIGVuZCBvZiBhdGtiZF9wcm9iZSgpLCBwb3RlbnRpYWxs
eQpyZS1pbnRyb2R1Y2luZyB0aGUgcHJvYmxlbSBmaXhlZCBieSBjb21taXQgYmUyZDdlNDIzM2E0
ICgiSW5wdXQ6IGF0a2JkIC0KZml4IG11bHRpLWJ5dGUgc2NhbmNvZGUgaGFuZGxpbmcgb24gcmVj
b25uZWN0IikuCgpNYWtlIHN1cmUgbXVsdGktYnl0ZSBzY2FuY29kZSBoYW5kbGluZyBvbiByZWNv
bm5lY3QgaXMgc3RpbGwgaGFuZGxlZApjb3JyZWN0bHkgYnkgbm90IHNraXBwaW5nIHRoZSBhdGti
ZF9kZWFjdGl2YXRlKCkgY2FsbC4KCkZpeGVzOiA5MzZlNGQ0OWVjYmMgKCJJbnB1dDogYXRrYmQg
LSBza2lwIEFUS0JEX0NNRF9HRVRJRCBpbiB0cmFuc2xhdGVkIG1vZGUiKQpTaWduZWQtb2ZmLWJ5
OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvaW5wdXQv
a2V5Ym9hcmQvYXRrYmQuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9hdGti
ZC5jIGIvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9hdGtiZC5jCmluZGV4IGMyMjliZDZiM2Y3Zi4u
N2Y2N2Y5ZjI5NDZiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lucHV0L2tleWJvYXJkL2F0a2JkLmMK
KysrIGIvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9hdGtiZC5jCkBAIC04MjYsNyArODI2LDcgQEAg
c3RhdGljIGludCBhdGtiZF9wcm9iZShzdHJ1Y3QgYXRrYmQgKmF0a2JkKQogCiAJaWYgKGF0a2Jk
X3NraXBfZ2V0aWQoYXRrYmQpKSB7CiAJCWF0a2JkLT5pZCA9IDB4YWI4MzsKLQkJcmV0dXJuIDA7
CisJCWdvdG8gZGVhY3RpdmF0ZV9rYmQ7CiAJfQogCiAvKgpAQCAtODYzLDYgKzg2Myw3IEBAIHN0
YXRpYyBpbnQgYXRrYmRfcHJvYmUoc3RydWN0IGF0a2JkICphdGtiZCkKIAkJcmV0dXJuIC0xOwog
CX0KIAorZGVhY3RpdmF0ZV9rYmQ6CiAvKgogICogTWFrZSBzdXJlIG5vdGhpbmcgaXMgY29taW5n
IGZyb20gdGhlIGtleWJvYXJkIGFuZCBkaXN0dXJicyBvdXIKICAqIGludGVybmFsIHN0YXRlLgot
LSAKMi40My4wCgo=
--------------3AfAKs2b0Kmg9oZsVXU3SqQo--

