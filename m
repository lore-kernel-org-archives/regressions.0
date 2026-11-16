Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825331;
	b=gmOF5MOYj34qTu2mwj/m1bLMPAdMOQMfIzxojGAWb5Z4KxvbbioPCtPfTPYcFFAB86wu
	 BFbKNGZFS1mFF7vkMtd7u6X7cORYHrTCqA0iTCNjCVq7l3er2d1r7Gx04pYIxYwr2neOR
	 9MlVVpW81FgC9p5dLLCwch7sKQ3X01Me0yCopgNaxoe6Q1QieNDX+O0yAbX0esHAT8+/x
	 MYrTaVJc9AtXi5gG+OVNcH/uzOOjzS9U1kaywZNd3osgvpE1tkziJMb5fSlULErrpqHVw
	 cEUt7XW5lrPS1M9Ul/3DT323wZu149vOgH1TsJdO9YNvogiqXYNDGNz3Cho0emveICw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825331;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 In-Reply-To:Organization:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=rdnz1ZKxJgMMz4r8HFGPdT9ij83o0Gc4gnC5NGVLfbU=;
	b=W1jRdILT5YrxcIcLpEzvVcwiH0eCYKCC6UiYUYBGFjnfMZwSN57UbSCgVn7BAo3jZmP5
	 EwBLagXWfFuzms+BRyQKucE3anrMJON+7irQdyAB1d3RkpoYd6BYz71Ql+r2CgAw3nscK
	 KAwx0wkXa0b184Uo8IXVtS/k6clLb7WDjfzwkQRJp916LgIWrWGIbqJqD6pLrHtt87OTj
	 9oRK6+JQTEcmj9IVtldMf33im08oIZfWtJvN01g8T+XaNeXRmH/qJxluLwLQUpVoJIiIG
	 /pBx4t3SdRd1p8czPFJb+DKnrZufUWDMZt98X6PVGWCStrG5E8iqkuYCLSvZho8Ovtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dMO8ecDb;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626F5606A323
	for <regressions@lists.linux.dev>; Mon, 16 Nov 2026 10:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 626F5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dMO8ecDb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794825330; x=1826361330;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=/UZDrPrPsnD6LBTHOM4nV0t5o1AUMv0eEZfDcvrX/es=;
  b=dMO8ecDbRCuSSm+wqSUU4ZAqvw7c/fzCrMwfpcYClhsGuUP6n67MoONk
   e+e3DCTGuqS3P14lO7Ys+xfl/xatnvXex38Y7dk9sK7Uf7HpVckYa1Sq2
   GAlSwipzDyALwv9lJ8x7dRrYogF7zIwkIKbF3TDaAmylr7Zo5IUVRjblb
   Nz8npAKT66CCsnEpNfgKwvAy0K86cQFayYHy2baprCIofrlOKUD+CQEcG
   1wBKVuC0i9RL86L8WYThY16ffeRS6t2vl+EiWaBizkXN+y1Dhw1/W3DFx
   zpfTk2bCptUr5qcliVskZYs4bpOVbaB3ELFT90xDj3w+oALETBOugJc/G
   A==;
X-CSE-ConnectionGUID: zqbKhCSiRtKJIk2NXhxeJQ==
X-CSE-MsgGUID: bw9krcWBQrKk2KXERQRX7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3546264"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3546264"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 02:35:30 -0800
X-CSE-ConnectionGUID: /bxSobFmRn26xiMcwxAH0g==
X-CSE-MsgGUID: cBiure3tSf6iBViQ1OYQYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9762142"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 02:35:28 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Frederik Schwan <frederik@tty42.de>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: regressions@lists.linux.dev, Imre Deak <imre.deak@intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>
Subject: Re: [REGRESSION] i915: UHBR training fails with TB5 dock after
 1fd440de4e02; source FFE update skipped?
In-Reply-To: <aveDNRBLx1a-9hRQ@mail.tty42.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <aveDNRBLx1a-9hRQ@mail.tty42.de>
Date: Mon, 16 Nov 2026 12:35:25 +0200
Message-ID: <40e2af4139b94eaeecd41fcdccb4ec1ef3dc098a@intel.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 13 Nov 2026, Frederik Schwan <frederik@tty42.de> wrote:
> Hi everyone,
> I just upgraded my system to 7.3.x and found a regression with my notebook/dock setup.
> 3x 4k displays are hooked to the dock, 2 by DP and one through USB-C (I guess that DP-alt mode then).
>
> Until 7.2 all displays worked. With 7.3 all displays work until kernel switches from fbdev (?) after
> which the 2 DP displays have no signal anymore but the USB-C one still works.

Please file i915 bugs as described at [1].

BR,
Jani.


[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html


-- 
Jani Nikula, Intel
