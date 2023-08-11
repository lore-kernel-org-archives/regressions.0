Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFB21865
	for <regressions@lists.linux.dev>; Fri, 11 Aug 2023 07:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691737446; x=1723273446;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=4Xr6cIZyo61wgyWwJ7i4qiC/z2WsGhfm+zwlnh5+rFU=;
  b=kydwnpizFFLE6KQCEpMfX9CjYEfo0ulEl/IuSjbBdWPBD4eAwqtdqeBM
   J704h34Nw9jAT+/7bOWMrl9DF1qs1LtiyuX8uzF/iNcieDNfj9YEUgFS+
   CMV1goCswXjDdcu4o8Is2XeRbwoX5YfSvNHzcNOXYksJpqOEyURs96q3a
   oD/M4/4B5G0xlPSKHH4KcJ104m0by5QaCEUzu3172uMvLjjikuVVnoGwc
   KfBUxwON9QOZOUdjxdJ3Zpmg0nW4nyWfC7tiT197pLOPvJgN3cEh63HWU
   CbjmJ7BhQ8n605jWMGCYsHFthtgoRNPDHMHgGUtDbi6UKe6Ss0KaZSRJG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="374382975"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="374382975"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 00:04:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="767569891"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="767569891"
Received: from vboyerx-mobl3.ger.corp.intel.com (HELO localhost) ([10.252.49.153])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 00:03:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>, Mikhail Rudenko
 <mike.rudenko@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, Neil
 Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [REGRESSION] HDMI connector detection broken in 6.3 on Intel(R)
 Celeron(R) N3060 integrated graphics
In-Reply-To: <f32b4636-969c-3b9e-6802-5991f511739e@leemhuis.info>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87v8dmr6ty.fsf@gmail.com>
 <f32b4636-969c-3b9e-6802-5991f511739e@leemhuis.info>
Date: Fri, 11 Aug 2023 10:03:55 +0300
Message-ID: <87o7jeqcv8.fsf@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 11 Aug 2023, Thorsten Leemhuis <regressions@leemhuis.info> wrote:
> [CCing the i915 maintainers and the dri maintainers]
>
> Hi, Thorsten here, the Linux kernel's regression tracker.
>
> On 10.08.23 21:33, Mikhail Rudenko wrote:
>> The following is a copy an issue I posted to drm/i915 gitlab [1] two
>> months ago. I repost it to the mailing lists in hope that it will help
>> the right people pay attention to it.
>
> Thx for your report. Wonder why Dmitry (who authored a4e771729a51) or
> Thomas (who committed it) it didn't look into this, but maybe the i915
> devs didn't forward the report to them.

It was [1], but never followed up on, and fell between the cracks. :(


BR,
Jani.

[1] https://lore.kernel.org/r/ZGIraoocR1gLCWjZ@intel.com

> Let's see if these mails help. Just wondering: does reverting
> a4e771729a51 from 6.5-rc5 or drm-tip help as well?
>
> BTW, there was an earlier report about a problem with a4e771729a51 that
> afaics was never addressed, but it might be unrelated.
>
> https://lore.kernel.org/all/20230328023129.3596968-1-zhouzongmin@kylinos.cn/
>
> Ciao, Thorsten
>
>> After kernel upgrade from 6.2.13 to 6.3 HDMI connector detection is
>> broken for me. Issue is 100% reproducible:
>> 
>> 1. Start system as usual with HDMI connected.
>> 2. Disconnect HDMI
>> 3. Connect HDMI back
>> 4. Get "no signal" on display, connector status in sysfs is disconnected
>> 
>> Curiously, running xrandr over ssh like
>> 
>>     ssh qnap251.local env DISPLAY=:0 xrandr
>> 
>> makes display come back. drm-tip tip is affected as well (last test
>> 2023-08-02).
>> 
>> Bisecting points at a4e771729a51 ("drm/probe_helper: sort out poll_running vs poll_enabled").
>> Reverting that commit on top of 6.3 fixes the issue for me.
>> 
>> System information:
>> * System architecture: x86_64
>> * Kernel version: 6.3.arch1
>> * Linux distribution: Arch Linux
>> * Machine: QNAP TS-251A, CPU: Intel(R) Celeron(R) CPU N3060 @ 1.60GHz
>> * Display connector: single HDMI display
>> * dmesg with debug information (captured on drm-tip, following above 4 steps): [2]
>> * xrandr output:
>> 
>>     Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 16384 x 16384
>>     DP-1 disconnected (normal left inverted right x axis y axis)
>>     HDMI-1 connected primary 1920x1080+0+0 (normal left inverted right x axis y axis) 708mm x 398mm
>>        1920x1080     60.00*+  50.00    59.94    30.00    25.00    24.00    29.97    23.98
>>        1920x1080i    60.00    50.00    59.94
>>        1360x768      59.80
>>        1280x768      60.35
>>        1280x720      60.00    50.00    59.94
>>        1024x768      75.03    70.07    60.00
>>        832x624       74.55
>>        800x600       75.00    60.32
>>        720x576       50.00
>>        720x480       60.00    59.94
>>        640x480       75.00    60.00    59.94
>>        720x400       70.08
>>     DP-2 disconnected (normal left inverted right x axis y axis)
>>     HDMI-2 disconnected (normal left inverted right x axis y axis)```
>> 
>> I'm willing to provide additional information and/or test fixes.
>> 
>> [1] https://gitlab.freedesktop.org/drm/intel/-/issues/8451
>> [2] https://gitlab.freedesktop.org/drm/intel/uploads/fda7aff0b13ef20962856c2c7be51544/dmesg.txt
>> 
>> #regzbot introduced: a4e771729a51
>> 
>> --
>> Best regards,
>> Mikhail Rudenko

-- 
Jani Nikula, Intel Open Source Graphics Center
