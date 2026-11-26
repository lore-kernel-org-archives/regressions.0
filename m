Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795727693;
	b=RDFlxQNVNU56wsfSRWBI+eJDdBjilIKf8r5gl52epBiBhRBHrK5hx9Lf8iO83+VuLJ1E
	 8Eaj0r5tPqa+WNj4wuh+yFr5gFJi8i9rEKVxK/9q6BGsWDKGp+qeti0mkeXQYtlcuGlb+
	 ruyjEyw+nOZHU3nU6WJCeBD5MjcE2uQHXoS8lm7AjoiXnzAl2RDTbnCTge3RtNILyv5HE
	 9/F4Kiq2Z+lr3qjQWjNqIykQohdCZQ/JRbzL0KGL1zaCLMHmjekLWnnBI6LOsrz6xZB/S
	 /Ah9RfR9RZcUNCifHMD99RmZubUApNCgwKFJv/fqcxeB2VNXeWs5DFAIv2hb6PfeRpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795727693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ckt2njikgL1ic3W1hR7aCLqud/UP1BsggMEUROxgHHA=;
	b=bA3po88uYZ/33BFSvkW55sYdDCUctd45RXgvJqE0k3TKIZ1hvHpt5r4tV4GBczFFokAV
	 j16cod/In43nf/2ka+tAuYATr2e9vfqKakkurljl7NjHbd45nqDyspUG3xB9+VTBVAEmm
	 zWFDj4u/DiW/iYBhtWSb4kQKSHKzMDyI5Tx5KtpGQWr3SxgUTA1zAyx5XQTW2JDtHpD9I
	 01iTi9III1YioO2SA62uc3h3SINPGQcu/vHYJKDEyKrYRjfZWt9JxEZIVq+1MDtFPfrN7
	 bkqsENpIEaMy4WQZu/8EA0ZBH3HK+ruNLnid3WK4t4RlBKXKXhbdKhq6JC2ltzUX5hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="N/bAqvQf";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD03606A31E
	for <regressions@lists.linux.dev>; Thu, 26 Nov 2026 21:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DD03606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N/bAqvQf
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f01f296937so55858895ad.3
        for <regressions@lists.linux.dev>; Thu, 26 Nov 2026 13:14:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795727692; cv=none;
        d=google.com; s=arc-20260327;
        b=gbHRPgAHYCjlgFRLeMZlPifHfGDzjWlfjpCgccAmn+xuwNy0mmU8WcU2UHTgdkfPch
         oTs+m4k3yaId3nUkjnHgShywZVwJ2EOWALOO8nVFShJIP7eCtSA3lf3cWbW0AuxdL7ap
         OSPY/L9H7NSUX4MxLftLG+XBJ8JSYSIGCfwhI0zJjg0ZyIJtvM75OryQ/fD2l+JnQT+f
         IYJPbSctEK3r4UAyb+c73wwxOe3jQxmT6YGVstim0E8Mz9ax54CyugSlpWy+BQM9s9V1
         +YwbQOyHmS1mFzp2gO12yzNx/SGtMjlQvpQp+ohpSorQG4YIOL3yWR7LEAux5DOjknEE
         QqKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=ckt2njikgL1ic3W1hR7aCLqud/UP1BsggMEUROxgHHA=;
        fh=l37/ud1IIMVv9Q/P/cK152eQoKPqnAMSesg03HesPv4=;
        b=o+lf6jXrmTtiFOiptfKbNHCEEH5k19AiVzXKfcthd0aMaYJapKARv4UxDciNy0EPLw
         GSifltM+WAwT9Jd1oTrYWnuaFr9bspuUmyp5GaqXYkyz2U16DGRo23oEn6BraMJ6S4wv
         vRNgvjLAaZNGBOmqVJzRNZ9rOI5/qchekzHKqVCmhdDtD36Sc3/CUkCtdTnmXpXTBchH
         0UvulJXy9LJxUyBG+jXj6pLzwUIcbKWP4LSJe2ixcJg8346YtP4aVB0GfNCYQuclDy2V
         FB3rwn2/Dta3lwBKA5yf5fH1jWF69Xc884aMkV0qiD4YnqVXChGpJJlyxLRYIGeCoUxZ
         nKVw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795727692; x=1796332492; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ckt2njikgL1ic3W1hR7aCLqud/UP1BsggMEUROxgHHA=;
        b=N/bAqvQfVpFTa//bUDyn6DHgzPaBnjv29gNALLL5TP4GlXaqV1+XE2xfL1yE/XtV1Z
         EpVHiBpyLg3smfmaoQ/LBeCZSaAupDg+jiephgemy5Daud4LZ97WTLbFSPMyGvfLckXc
         lFmKzsQFPt1VzAHQOxU7bjbjaUapyo/jWUYLlubnuGydVqEFUCmTGI9aQ+38r+C8pbiR
         OuYNhY9u+egrPF+WUBkz2QzEJ7O8NenzsneNKfmzoG9rndETD/PbvbpcFlfLFX/yZirp
         h7YeRse7EU9F2oNzxhqDwjMsUnqqH2I4DE3wL3Q97z56BsejKk93pA3LUi+usomVR6yy
         nvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795727692; x=1796332492;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ckt2njikgL1ic3W1hR7aCLqud/UP1BsggMEUROxgHHA=;
        b=1SAGJ5J9y8bXQwfeqIrwzTjYgUXlM/D0BNatwXWCBmfRfyxacjncynSt3NJxGU9YXE
         G8nx3QezJDWhux+wNA3ovjBdHSMSq9jZZ4LTjWk3f3vBcCbBuQjfKfva6CN5eFCmXVFN
         c75/4zDm+h7xLYJ9bKCoaRmpxgf0D3sRviNqeNv4hoH+PNSQAzHTfk3iKI0uVf1un5rl
         LL3c0HLilQV8j77pGhf2qxkZJbuHjmErtGeSvaL88bL0hHeRQF5O+GAQA538QEAKV1OL
         cjnBiIWJkApTEuFPeOVU5GaLJCiptu8I0hmZitc9jLATODpRYzkaVTxXUi0xq/JuZdsv
         3GbA==
X-Forwarded-Encrypted: i=1; AL+hErGZ9AS0wiRL3QlCcdDnM6dzgZwrUY45kLowuCnkhbcrQqYRL5M8MmFpZBa4T9f+KKazHqj/zQ2aVtOcHw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8xb5sOc9ooSTeNu5ST0TkyXUnfcB6CfdYCFhigyd6kgoKn1pWy
	74FiC2cKjPX/a7focYOJMP6hr40hjooDY1fqcEBMRwdp0zr6akHw/x90lqkHIl386O+EtV10LXg
	rPmwHKB1m7SHVc40c3Zh+tklEEe5Yrpc=
X-Gm-Gg: AZFdTZeb5/48S3kBeNPohD4anR3ZO0TNemaVZ1xsQMvYFyeon7sdWznxozPbAPOGbos
	oAmIoDSRGCtU/mH05F/4GVVAv/ZVoRCHQHbeGUCJt/WCdIhJCQMn6T49wrVsF6mqaVz9el3OXjQ
	gIsIr9Np1ySEQ+UduyWYM8fQVNldyXUN/b7ODWPYgpz3ZeLt6M1cq2HkYiVZh0qZ5zcZWJV91q0
	DbMnFqvY3C8f7kvf9WCLbFknRWnUn/X6ZQ2kOJ+H6idUF5YaCbJ6OA47A3bC4H1LiYQp1O3pJZ/
	DT0pKBNTG9WM+Yw8RKhvaQGuV8znRpCO6dXUnqPqBpYY9P6DlgDZLGeMnayXq90QP7ADOGQWgCz
	wWO+0JyOtCIUSGcb3ap6zL4fmrfA/RD8BcA==
X-Received: by 2002:a17:902:e5c5:b0:2ed:a96:8a03 with SMTP id
 d9443c01a7336-2f03f27e77amr206374105ad.55.1795727692234; Thu, 26 Nov 2026
 13:14:52 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 15:14:50 -0600
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: flv.giacchetti@gmail.com
In-Reply-To: <CACKiateKEggvx60zugZt_C1ejcLv55OiL6Hyv=DkF72370FU1Q@mail.gmail.com>
References: <CACKiatc1Bj2et4kcXDJiYx28XXxoo6iHPc9nYt3GhTCxUmdnsA@mail.gmail.com>
 <20261125203211.76029bf0.michal.pecio@gmail.com> <CACKiateKEggvx60zugZt_C1ejcLv55OiL6Hyv=DkF72370FU1Q@mail.gmail.com>
Date: Thu, 26 Nov 2026 15:14:50 -0600
X-Gm-Features: Aa3M54pqAbUFR54EeJrok3NlplyzTGh_qB0asFD2VpdsVTGnDkBxrS2IGMdtoOQ
Message-ID: <CACKiatdTKoyWu6gphWm1Zb8kF6pFBNfcN42zW7-sNMUdYvbDrg@mail.gmail.com>
Subject: Re: [REGRESSION] Creative Sound Blaster X3 (041e:3264) fails USB
 audio probe on Fedora 7.3.4
To: linux-usb@vger.kernel.org
Cc: linux-sound@vger.kernel.org, regressions@lists.linux.dev, 
	regressions@leemhuis.info, michal.pecio@gmail.com, oneukum@suse.com, 
	tiwai@suse.com, perex@perex.cz
Content-Type: text/plain; charset="UTF-8"

Hi Michal, Thorsten, and ALSA maintainers,

I reproduced the high-speed failure again after a Creative App reset on
macOS and captured usbmon from before plugging in. The following tests
used the same X3 (041e:3264, bcdDevice 10.90), cable, rear port (1-10),
Intel xHCI controller (8086:7ae0 rev 11), and stock Fedora
7.3.4-300.fc45.x86_64. The device enumerated at 480 Mb/s.

With the default driver settings, device and configuration descriptors
completed normally. ALSA then sent a UAC2 SET_CUR to clock selector
0x22 on AudioControl interface 3. The X3 descriptor gives this selector
a single input, clock source 0x21. The selector write and read-back
completed. A subsequent clock validity GET_CUR for source 0x21
returned -EPROTO. The next SET_INTERFACE timed out, followed by more
control requests. The key usbmon setup packets and completion results
were:

  21 01 0100 2203 0001   SET_CUR selector 0x22         success
  a1 01 0100 2203 0001   GET_CUR selector 0x22         success
  21 01 0100 2103 0004   SET_CUR sample frequency     success
  a1 01 0100 2103 0004   GET_CUR sample frequency     success
  a1 01 0200 2103 0001   GET_CUR clock validity       -71
  01 0b 0001 0004 0000   SET_INTERFACE (if 4, alt 1)  -2 after 5.08 s

With ctl_msg_delay (20 ms) alone, the write to selector 0x22 again
completed. Its immediate read-back timed out in that run, before the
first sample-frequency write. The -2 completions are consistent with
usbcore cancelling timed-out transfers.

With only skip_clock_selector, two consecutive hot-plugs registered
the X3 in ALSA, with cdc_acm still bound as ttyACM0. Clock-validity
requests succeeded. The first PCM playback altsetting advertised
48/96/192 kHz at 16 bits, but the subsequent 24- and 32-bit playback
altsettings returned only 48 kHz. The trace showed the driver
activating the first altsetting before querying the next one's range.

I then added skip_iface_setup. With both flags, all three sample rates
were advertised for S32_LE. I saved the following modprobe option and
repeated the unplug/replug test:

  options snd_usb_audio
quirk_flags=041e:3264:skip_clock_selector|skip_iface_setup;

ALSA registered the X3 again at 480 Mb/s. I played a silent stereo
stream through PipeWire at each rate and checked ALSA hw_params and
status while running. The hardware PCM was S32_LE at 48, 96 and
192 kHz, with no further USB audio timeouts in the kernel log.

One other symptom may be relevant to USB core. During the failed
probe, Unity's main thread was waiting in serial_show while reading
the Intel root hub's sysfs serial attribute. It proceeded when the
old device was finally removed, about ten minutes after enumeration.
The USB hub worker was still handling probe timeouts after physical
unplug.

These results identify a reproducible workaround on this unit. I
still have to test mainline, and I have no first bad commit or evidence
that distinguishes device firmware from host/controller behavior. The
earlier cdc-acm RFC remains withdrawn. Would a device-specific
snd-usb-audio quirk be appropriate, or would you prefer a targeted
xHCI trace or another controlled test first?

Feel free to reply here or contact me directly at this address. I can
reproduce the issue on this hardware, share sanitized traces and
descriptors, and test a patch or an upstream kernel build.

Thanks,
Flavio


On Thu, 26 Nov 2026 00:17:40 +0100, Flavio Giacchetti
<flv.giacchetti@gmail.com> wrote:
> Hi Michal,
>
> Yes. The earlier Fedora 7.3.3-300.fc45 logs show the X3 enumerating
> at high speed and cdc_acm binding to interface 1 as ttyACM0 without
> the rate-query errors. Audio worked. In a later 7.3.3 boot the same
> unit enumerated at full speed (12 Mb/s), so that later run did not
> establish a working high-speed baseline.
>
> The failure also reproduced with Fedora 7.3.5-300.fc45 and its stock
> USB and ALSA drivers, with a different known-good cable. At 480 Mb/s,
> the X3 disconnected and re-enumerated, then failed to answer USB audio
> sample-rate and mixer requests. On 7.3.4 the same high-speed failure
> also occurred with my experimental cdc-acm module loaded and the ACM
> interface unbound. Please disregard my IGNORE_DEVICE RFC as a fix.
>
> On the failing 7.3.5 run, the USB hub worker was blocked in
> usb_start_wait_urb -> usb_control_msg -> usb_get_string, called from
> get_term_name during snd_usb_create_mixer. A 30-second usbmon trace
> showed repeated endpoint-0 GET_DESCRIPTOR (string) and class
> control requests. For several requests, the next completion came
> about 5.12 s later with status -2 and zero bytes, consistent with
> cancellation after the timeout. In a separate 7.3.4 run, the Intel
> xHCI driver logged two "Event dma ... not part of TD" messages at
> disconnect.
>
> When the old probe finally unwound and a different rear port was
> enumerated, the unit briefly appeared as Creative 041e:6007
> ("X-Fi UltraDSP"), with HID and CDC interfaces and no USB audio
> interface. A targeted USB reset completed but left it at 6007. It
> later returned to 041e:3264 and still failed the audio probe. I
> have not identified what the 6007 state represents. Separately, a
> local WirePlumber rule forced 32-bit PCM and hid the output when the
> X3 enumerated at 12 Mb/s. Removing that rule restored 16-bit/48 kHz
> playback in that mode, but did not fix the high-speed USB failure.
>
> I then reset the X3 using Creative App on macOS. Back on Fedora
> 7.3.4-300.fc45 with the original cdc-acm module and without the
> experimental USB quirk, the X3 briefly disconnected on the first
> plug-in, then enumerated again at 480 Mb/s as 041e:3264. ALSA
> registered it and I verified active stereo playback with S32_LE at
> both 96 and 192 kHz. There were no further USB errors after the
> successful re-enumeration in that test.
>
> This is one successful test after resetting the device. I have not
> isolated a bad kernel commit or reproduced the issue on upstream
> mainline. I can provide a sanitized USB trace and kernel stack. If
> it recurs after the reset, would a good/bad usbmon comparison
> starting before plug-in help distinguish what happens at the first
> disconnect?
>
> Thanks,
> Flavio
