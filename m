Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85A337C109
	for <regressions@lists.linux.dev>; Sat, 17 Oct 2026 23:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792278773; cv=pass; b=im3VC0mgFvf0hql2XoHr7dTz4/3hdbKXCW76B8Ic8ubFM2r1FZYdnIJ/M20sx7lp/mnqGyzY6/y+sNtdZcbReIvSIVpHY2YEsyNI20QyS1imanNNp58ikhGjCBVtj0lixotAgWf27nJgr3HoFqmbEWailcBJb0SvX4HlQffO9Ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792278773; c=relaxed/simple;
	bh=Lcn+Qs0uiwtnlOCcugPxjXr2GSZhyyUpSDrObLaCOjo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=V4jSJKyOElTbhOn3DkgIcHN44kq5JvPuKs9Tx2CEQdNwHSh/YrdM5Wu2rEXesMgGcW7mEBPvu1AvJnhtXUrNLgPWaLCBF/PPQ+EVJj78AKsh23ajGB8ZPSJvT4a7oIdjAc6zuhJ27ZwDONxDvecLhC7j/OhlJD0k/Mg6f8Xy2KQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEhJUfkz; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEhJUfkz"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5ba3b1199f6so972373e87.3
        for <regressions@lists.linux.dev>; Sat, 17 Oct 2026 16:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792278770; cv=none;
        d=google.com; s=arc-20260327;
        b=jfLRR08WWBQttece08anYKJSzRB/iPdvkLTcxDvVIaYGiu0TOg4fVpQ6qdxI/Wfa2c
         EcHBO9/EuHAWI3NJ1gVKp9dA6XrSkQ4pbc0WLm3IfmCduTjLhRxetYUBcbyFc4Hv+WkC
         wXjph5kSLJOu3I2lYQaUEKHXybcniQV6WpX9N1H0QlvlL48BxJmS3xJ+eqGIn+mLAIqc
         oeifM+Gi4ZBmSEYlVTG85STZjD8HCwPAB24JULjmlzzjSkhNbKc+BYgMnbeMUoMWp8GJ
         egK3xQ70XiPKWAdNPQr/Pi9levfGM+fkaTZEM9YAiJE14WQzuU43xRupVhulcXNpJIUY
         tS0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=cLA4jswBq21u3uDgRDpKl04UzBdoBSJ1Zn64aYp/wdo=;
        fh=z57ZUybT85/5kG0EduVLm2RFp32CYsxyWsTkTbNwek8=;
        b=CChOApBRsKm82Zci5MGgKXzu9KcVpbjiJwC6yulyjazPASkxgsmMEwn28aafbkwJt0
         CYMU/P1V14x4D46UQrs2p3VJvguQuHpOp2/a4G7g8CWQV2C2ZT3K+GvAmxfU+57BZWNE
         O9VsH1uEJ7wvjalgMVvsE9k9qvTup7iU7Gpxba8ahMcOlrg8GsLkR6zW4WOBit8el/yR
         rFOZh4WiXy57WB7zaLvrtoyde2MOXj53gi/3qDNrNHElzS44WQ4AjnRdEJstpKQL53UQ
         BzDg1xcMOjRcKHgmO5CPnUX+AqERUcv9tJfsFyYOJCFs88P+OZ6Cc3ulJsK1TzbMPSjD
         cIUg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792278770; x=1792883570; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cLA4jswBq21u3uDgRDpKl04UzBdoBSJ1Zn64aYp/wdo=;
        b=jEhJUfkzYODxfqppJ12XaeOR9vfS19JULiSZ+hqcMQ32m0F+5J/kZeSUbiL9fVGsLV
         tnHkPZR/J6vONJpBpHz9toKFyoz4E/bbISRwnuPRzaPJWy5TmBV2RtbQwuyM2DK+twpb
         Hoklk4g8xTTX98cyCrS6OMkXqOhBCYr05cdWPLfbInR4jnfHIcoyfqs8/ysEEaK9yYKz
         aBioioyDqSW1fYO9N8zd3RwJrh9NBIqCimEN53Ob1x5vh2H02W60gh3KlsOMw/Wp6Ukl
         ZZTz2BepbtqcsteOHRKgSSpj3DoEz9U+Di/rsIFnWTKesgYwQ5jvWfmSLP2gJtffCFUU
         GjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792278770; x=1792883570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cLA4jswBq21u3uDgRDpKl04UzBdoBSJ1Zn64aYp/wdo=;
        b=y8IUjrAt1ggvsVw1SrbiNMwS3dDpFpv0+HbnXOAFkkCGimMYW44Q/o/URqocWtDW/H
         llczBy7EcgkKUofLHrc30qnJjJcJqy+mFBkp8T4mDclwAzdSp5WUZaU/exaK5fm1ML27
         lVBwEVIV7ZxAjtwg6AWcEajkDU3FbnLuN+7W2l2z9TVUcFc+4l/61LynuvLoH0ZdmmUU
         w1+70RcV0p4Oh3iqWjjGAGtznKXc+pMcNuP/scmOGVe6wF947fsbHjjZC1sjQ6yK1Htq
         lcKTJbG27zYwt2rHr/daumQVmZJFTpNOMZVDie0YKK145MCYCSCgoKcBELW+Vu7Sjc3w
         TZ5g==
X-Forwarded-Encrypted: i=1; AKwUvBwzja42FuZsljwCGobyPc87Ub+shIDWnyuNwAu/NuhLMFJ5Vrm7lIYlNG4oiBiIeCphQ5wG7kE3J3KajQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIJg6E5FLk94j+3G4T2H3QMEkguozT+Blnn1B1DYya7W7UM9lEX
	LWLfI5Ls61VqT6N+m4/sjRX+hOpog78zLddSevWnAnYoiHpJHMTZrL/0Y7+5ARZ8m54Nuv8/VR0
	u1tlRchtjEvaPNKsSW9fg8mZEN3hZb/A=
X-Gm-Gg: AYBFou2IqjCW+qhIwdrQTcQlTuVqWS2lBl7QiNKABdnOE2m6PUTaP/bZkvZcSUMLkpW
	vdTFHUdjEgvXfiC4XNAnIkY4woAmkeVDqGoxFjIR1mJnmYKFMqjOrrTSEjfsEmRZH55xrGDExhP
	1/+xEiSb7UKQe3O6Fxk8v1c7/KgXN+cypCoTwFyMjRtu1tJD3ZFKZPf6N61GgYigchxafMy+2rR
	XfkIUQ+fSMVURlRyGPLU37hguTLu1dap2LLxm+orQ9mdn67dtjlJhxGfJN8BiUC+3ZEK4K3N27N
	c0OLXQ3+UdT8iO6B5YtHJ/EOitJvuKqNWyZHrj6iRl01oFxz6XqqoJIKBpUCPGQt/SJM5kk4J9E
	iyKO7W4lAaOSofw==
X-Received: by 2002:a05:6512:b8c:b0:5bc:dd4f:c3b with SMTP id
 2adb3069b0e04-5be50a72c99mr992481e87.33.1792278769657; Sat, 17 Oct 2026
 16:12:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?B?TG/Dr2MgS0FTU0VM?= <loic.kassel@gmail.com>
Date: Sun, 18 Oct 2026 01:12:38 +0200
X-Gm-Features: AclHuK9-AjNmYzX1iG8JbGL6r55wNosQzwWegrmilVkKGZR91-wQYqsz3EtKGG4
Message-ID: <CAAzpgGdksHZjx4jc20zqnAG_PQ2e1ggANQjt2eiycUiWc+vPHg@mail.gmail.com>
Subject: [REGRESSION] mac80211_hwsim: beacons stop after host suspend
 (beacon_timer is CLOCK_MONOTONIC, expiry computed in boottime)
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Benjamin Berg <benjamin.berg@intel.com>, linux-wireless@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Since 7.2, mac80211_hwsim radios in AP mode stop sending beacons
after the host has been suspended once. A single beacon goes out
roughly every <time spent in suspend> instead of every beacon
interval, so stations see massive beacon loss, scans come back empty
and APs without associated stations become invisible.

Environment: Fedora 44, kernel 7.2.11-200.fc44.x86_64, hostapd 2.10
(Alpine), radios created with "modprobe mac80211_hwsim radios=3DN",
wmediumd in use. I have not tested a vanilla build, but the code
below is identical in current mainline and wireless.git.

Symptoms (station side, after one ~5 min suspend of the host):

  $ iw dev wlan0 station dump
          beacon loss:    480
          beacon rx:      1

The station stays associated (unicast data still flows, the timer is
only used for beacons), but a second AP on another channel is never
found by scans, so roaming cannot happen. Nothing is logged in dmesg.

At that point CLOCK_BOOTTIME - CLOCK_MONOTONIC was ~302 s on the host.
After a reboot (gap =3D 0) everything works again, including roaming,
until the next suspend.

Analysis:

The beacon hrtimer is still set up on CLOCK_MONOTONIC:

  hrtimer_setup(&data->link_data[i].beacon_timer, mac80211_hwsim_beacon,
                CLOCK_MONOTONIC, HRTIMER_MODE_ABS_SOFT);

but since commit 933f5bec98a1 ("wifi: mac80211_hwsim: register beacon
timer by calculating TBTT") the callback re-arms it with an absolute
expiry derived from the TSF:

  hrtimer_set_expires(&link_data->beacon_timer,
                      mac80211_hwsim_tsf_to_boottime(data, tbtt));

and the simulated TSF is based on boottime since 1926f4e06dce ("wifi:
mac80211_hwsim: rename and switch simulation time to boottime"). So an
absolute boottime value is used as a CLOCK_MONOTONIC expiry. Once the
system has been suspended, boottime is ahead of monotonic by the total
suspend time, and every re-armed beacon lands that far in the future.
The first beacon after enabling still works because it is started
with HRTIMER_MODE_REL_SOFT.

Before 933f5bec98a1 the callback used hrtimer_forward_now(), which is
clock-agnostic, so 6.12 and 6.18 are not affected.

Possible fix (untested): set the timer up on CLOCK_BOOTTIME, like the
NAN timers in the same driver already are:

  -      CLOCK_MONOTONIC, HRTIMER_MODE_ABS_SOFT);
  +      CLOCK_BOOTTIME, HRTIMER_MODE_ABS_SOFT);

(in mac80211_hwsim_new_radio(), for link_data[i].beacon_timer)

Reproducer (wmediumd not required as far as I can tell, the timer
path does not depend on it):

  1. modprobe mac80211_hwsim radios=3D2
  2. start hostapd (any open or WPA2 config) on the first radio,
     scan from the second one: the AP is found
  3. suspend the host for a while, e.g. "rtcwake -m mem -s 60"
  4. scan again from the second radio: the AP is no longer found;
     "iw dev <sta> station dump" on an associated station shows
     beacon loss increasing

#regzbot introduced: 933f5bec98a1

I found this while building a containerlab-based Wi-Fi lab (hwsim
radios moved into container netns, wmediumd on the host).

Full disclosure: I am not a kernel developer and not very technical.
The symptoms above are real and were observed on my machine, but the
debugging, the code analysis and this email were done with the help of
an AI assistant (Claude). The analysis may therefore contain mistakes.
I am happy to test a patch or run any commands you send me.

Thanks,
Lo=C3=AFc Kassel
