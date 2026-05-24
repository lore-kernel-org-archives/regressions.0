Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1EF330668
	for <regressions@lists.linux.dev>; Sun, 24 May 2026 14:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779634013; cv=none; b=pXOLcG2qaJJuRYRCLsfDk5b6XIXYTa9g1q1xNO1jsHAr2WzbzTwRNE2Ylfq6Su5ZUGuCDlRT8OELJ5s/qT35ec5Pmt+zUFkAnmWNsy2qnD88l8M+5mnlxiKSnOP0nPbtdCEV0XVEu6w8YY4t2iFvMnCViGH1+b36c1wVJPGuvvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779634013; c=relaxed/simple;
	bh=JEZWG6SWAXC3kSsKtJeswOT8sOerhSc4wffC3XsQE5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqIfKoW2scVBU1HIgekgb1/sanV+q6fjF9DOZiS8MrDgi1BVq7aWdRw71FDlzF5RyaYvKqD5ofm6KUB3rTPFIcPODcCWCK9ayzZcdoY5mIzSVctlmA+z3YLAFgvH8tTRiD6VVQSGzGWt+Nx/iAo0lCENXnvJGs0dSizWy3Dm2ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTi5XOjb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTi5XOjb"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so92129285e9.0
        for <regressions@lists.linux.dev>; Sun, 24 May 2026 07:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779634010; x=1780238810; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A6knduYAQaCV7hHxlTFEjJDyN7v2hRFonwrpL8674II=;
        b=sTi5XOjbDMsODsbwYWU+V6zmNfJ3uXDlbjrRmxmmQs8ybod7mxeWy+mC0w4yv4UZST
         h58avnTrmTLorHrIIqAGW73Lz4DjutiVGZbXiZd02dE0L1i89/mF/KV4w9OV92vLFCz7
         Ixvl1tPreOkcGNRZlbbi1PEbRdBsEkjotJ+qgLPDJLkFu+oTsLHM5EAGng/EC00s2TmX
         l+sgQ6df6syCI0FR20zeuagyG4DmoI1rvUmhul+y06JnIRMxOmajXBZxIQ1+0upwakv2
         yrdQxP0kwos3t/robVmZMYLHxVkZjPzU05osah/ZLSwQL/G9RfJQo+T8hrje7wrBdSut
         Fu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779634010; x=1780238810;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6knduYAQaCV7hHxlTFEjJDyN7v2hRFonwrpL8674II=;
        b=N4ZRMHSb005GOgAgCl3xvvzng1i3VTiCWhvmn3uv//9IBRaCM5i8isBAxs3deyduv5
         WJ8XwsbOqeaCUup0BprKHWv/GJOVSINcFF+Lnl4NVs7SsC1+67w4V1P3zv6/sBKmIUeu
         j5LtzHgvjV76I1vpuAYOjzXIF7Aq5FRKs9nhwo1dd5MA78vLpdettzGVkdP0Iy04RlRI
         h5dI4Bmx3d/rkdJQ1HzVbMkT7aOtLEmRO9JgKVN0Ps9fm4tRjWoaGNd/mmbVnY/9eLmq
         GH9w/Sv19GijAOTJjkP8zqDPzQ6AVFaBCueAC9mgSVJgwfM6JLa7twPh4cpJYYgQ0i5p
         7hzw==
X-Forwarded-Encrypted: i=1; AFNElJ9876xYbvIjC8L5etKhGoOUNsToQYdojOc/imnfcUD+fQww7VlI1YsWIEmpazO0M6+Yf2AsAmrTe/bX0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyjwvSokqVow0Wy+BRo3nzppyh08Ss8q4axcyVmsqcwdU/BZ1oi
	1qYcT2tBf77wB2FU49yjQTDQZGxIWGj+GsxDAbzNW35pY6TdC4mOGr3g
X-Gm-Gg: Acq92OGV6HPsZMHtLuK9kf2ZE/6o+A/sJiNLtA+Cu5kSC3l6MxOqQqba281zcIAiqKa
	QeZ64UrWlc25MqkQTH+uhHJ/N+AjnaOtMOUHHouxSIa2yn2AzmROHTwt6JyOZ+sW4aGDl5+Snob
	9/yVVZD4RtQD5fjawf260mSF4HQlX9xKOC07vQDbEEu6kO9lTB+j/Us/H0vJUPDJwNxV1+1sBT1
	bHpixnHSG9zM8HhzTlnfP9VYLe0iuxbUrBgqJN5o24faoF1HPjbm4WDqtRm08KXL6TXNa+m8hTe
	Y7FmC+yTB2TS0Iw399TPuX4TYxjlX5x88B5NQDum5BOfl9+txdMBdiF+dzqPlNiuyFoiRn9UUCj
	HwcmhTSXwGJF3//r+THj6Deg3imrnv3LOBqUkXnli0Q5kfzCZr3E0FtOXQjpC40q9igdZsaIS4L
	VF9yqU6de7x/2fi0bExCwFMO8VeMYuc6Z8XKHKjEctWWmn81GMFrExhfolKx0=
X-Received: by 2002:a05:600d:6450:10b0:48a:7a10:4f17 with SMTP id 5b1f17b1804b1-4904249d125mr126693985e9.6.1779634010232;
        Sun, 24 May 2026 07:46:50 -0700 (PDT)
Received: from eldamar.lan (c-82-192-247-196.customer.ggaweb.ch. [82.192.247.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454cfcaesm177192395e9.4.2026.05.24.07.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 07:46:49 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 77111BE2EE7; Sun, 24 May 2026 16:46:48 +0200 (CEST)
Date: Sun, 24 May 2026 16:46:48 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
	Sasha Levin <sashal@kernel.org>, regressions@lists.linux.dev
Subject: Re: [PATCH 6.12 375/666] perf tool_pmu: Factor tool events into
 their own PMU
Message-ID: <ahMPWN_PZlQLisk4@eldamar.lan>
References: <20260520162111.222830634@linuxfoundation.org>
 <20260520162119.375577583@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520162119.375577583@linuxfoundation.org>

hi Greg, 
On Wed, May 20, 2026 at 06:19:46PM +0200, Greg Kroah-Hartman wrote:
> 6.12-stable review patch.  If anyone has any objections, please let me know.
> 
> ------------------
> 
> From: Ian Rogers <irogers@google.com>
> 
> [ Upstream commit 240505b2d0adcdc8fd018117e88dc27b09734735 ]
> 
> Rather than treat tool events as a special kind of event, create a
> tool only PMU where the events/aliases match the existing
> duration_time, user_time and system_time events. Remove special
> parsing and printing support for the tool events, but add function
> calls for when PMU functions are called on a tool_pmu.
> 
> Move the tool PMU code in evsel into tool_pmu.c to better encapsulate
> the tool event behavior in that file.

While building now a complete set of packages for Debian for 6.12.91
where perf tools are included as well, I noticed that now the builds
fails. In fact in v6.12.91 

$ cd tools
$ LC_ALL=C.UTF-8 ARCH=x86 make perf

fails with:

[...]
  CC      util/stat.o
util/tool_pmu.c: In function ‘tool_pmu__config_term’:
util/tool_pmu.c:62:49: error: implicit declaration of function ‘parse_events__term_type_str’; did you mean ‘parse_events_term__str’? [-Wimplicit-function-declaration]
   62 |                                                 parse_events__term_type_str(term->type_term),
      |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                 parse_events_term__str
util/tool_pmu.c:61:79: error: format ‘%s’ expects argument of type ‘char *’, but argument 3 has type ‘int’ [-Werror=format=]
   61 |                                                 "unexpected tool event term (%s) %s",
      |                                                                              ~^
      |                                                                               |
      |                                                                               char *
      |                                                                              %d
   62 |                                                 parse_events__term_type_str(term->type_term),
      |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                 |
      |                                                 int
cc1: all warnings being treated as errors
  CC      util/stat-shadow.o
  LD      util/hisi-ptt-decoder/perf-util-in.o
  CC      util/stat-display.o
make[5]: *** [/home/build/linux-stable-rc/tools/build/Makefile.build:105: util/tool_pmu.o] Error 1
make[5]: *** Waiting for unfinished jobs....
  CC      util/perf_api_probe.o
  LD      util/perf-regs-arch/perf-util-in.o
util/cgroup.c: In function ‘evlist__expand_cgroup’:
util/cgroup.c:498:32: error: ‘struct evsel’ has no member named ‘first_wildcard_match’
  498 |                         if (pos->first_wildcard_match)
      |                                ^~
util/cgroup.c:499:38: error: ‘struct evsel’ has no member named ‘first_wildcard_match’
  499 |                                 evsel->first_wildcard_match = pos->first_wildcard_match->priv;
      |                                      ^~
util/cgroup.c:499:66: error: ‘struct evsel’ has no member named ‘first_wildcard_match’
  499 |                                 evsel->first_wildcard_match = pos->first_wildcard_match->priv;
      |                                                                  ^~
make[5]: *** [/home/build/linux-stable-rc/tools/build/Makefile.build:105: util/cgroup.o] Error 1
  LD      util/arm-spe-decoder/perf-util-in.o
  LD      ui/browsers/perf-ui-in.o
  LD      tests/workloads/perf-test-in.o
  LD      ui/perf-ui-in.o
  LD      perf-ui-in.o
  AR      libperf-ui.a
  LD      tests/perf-test-in.o
  LD      perf-test-in.o
  AR      libperf-test.a
  LD      util/scripting-engines/perf-util-in.o
  LD      util/intel-pt-decoder/perf-util-in.o
  LD      perf-in.o
make[4]: *** [/home/build/linux-stable-rc/tools/build/Makefile.build:162: util] Error 2
make[3]: *** [Makefile.perf:789: perf-util-in.o] Error 2
make[3]: *** Waiting for unfinished jobs....
  CC      pmu-events/pmu-events.o
  LD      pmu-events/pmu-events-in.o
make[2]: *** [Makefile.perf:292: sub-make] Error 2
make[1]: *** [Makefile:76: all] Error 2
make: *** [Makefile:93: perf] Error 2

Regards,
Salvatore
