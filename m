Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D24C7B
	for <regressions@lists.linux.dev>; Tue,  1 Nov 2022 22:01:52 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id u11so22863248ljk.6
        for <regressions@lists.linux.dev>; Tue, 01 Nov 2022 15:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cb+tt9Vtj615rOrk5Qe1IbJBDO4sgCO757XJJ/DJ6iw=;
        b=lAxW1D8vqNJPKLYEA3wmWpu8nXmAvhM56I+75pXI5bch9ayzOM1BIgSgbZQnqy5g95
         ytdzXSRmiRlrGW5TkN0eHoDLCSfxXApbBzhaNKsKFMDDUxmisMVizgv4t0h+lMzG0DEs
         xXZpbCrCzoq+ItfLqH+r2gs4I5NVGQ3J0I9GGczNQWgZZzB3J9H/6sxe2Ip+sr+ypMsJ
         sfSA4F8vImPylcbBGpX369T/swtKAfV4DDV7fo2I+fpxysMnxXFragJG6OBfmNNNchVY
         iwDZ87Pay5wPd3DHMEFbA2PTID1UiQGf8w0v4mJzm96Fdgzj93BD+9d3655s/qqH5dL0
         4SpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cb+tt9Vtj615rOrk5Qe1IbJBDO4sgCO757XJJ/DJ6iw=;
        b=BEC45twjIJ6UAwAYC5S1v2DwPtzg87pi3DINDPiLm9PV+y8oVSe1fz4FADt8sS4mzL
         6l/iRy37s+cqv2fYk47kqe/gwB7iHkEBjrzvhZ0CJnJxLGa+4/joV2ZSp7I7z3p0EQbD
         vFmaUzlKttLm44NRO2VMuO/I3kgoC9k0Bvg6boNJHN5HerLtL8IZG04qUxSTf9NE824a
         DsH/BqPq364j+nGiPBW8rSmbXg0iMbmk54bweMlGyq8mziiIQUJsoVC8SZ/YSSkBEmdJ
         yHTPVjRnqSmz8TedlR7YYBcXt0S/uWfDwyIpDgSgJRC92yQhGBNFErQmWHOHMczgq+ym
         ZBoA==
X-Gm-Message-State: ACrzQf00U51k381CdlZYKb1yhEPZPYvEdyocIt2DiU27ykCyhkqhJj4M
	PASPhUR7MralfFfDbFFVQiYiv3j3ycvpgkVHwX0=
X-Google-Smtp-Source: AMsMyM61WyYzDD6Xmh5TB9DP6GzRoiHWWRokJZEctycLLrpprMbnj3c/WbietIKDX3lmK23IcRHhJUD/PIHFaR+JKhA=
X-Received: by 2002:a2e:3012:0:b0:277:32d:34b4 with SMTP id
 w18-20020a2e3012000000b00277032d34b4mr8044871ljw.112.1667340110382; Tue, 01
 Nov 2022 15:01:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAM6Wdxc0KRJMXVAA0Y=u6Jh2V=uWB-_Fn6M4xRuNppfXzL1mUg@mail.gmail.com>
 <20221031145046.2a7f9d32@rorschach.local.home> <CAM6WdxeZbGmRopXqLtDNTwPOahnyC6GrCfv4H1m=mF41-J=VbA@mail.gmail.com>
 <20221101153135.5345c748@rorschach.local.home> <CAM6WdxfYU1Dc6dkMQMSGjgiggrziLvfwVPJV5OC02_AQO8YkVw@mail.gmail.com>
 <20221101173802.7a476a04@rorschach.local.home> <CAM6WdxdAF5X8v_tbL1LvNDXgEPY5veL_OtQv5CrADV9qH4um-g@mail.gmail.com>
In-Reply-To: <CAM6WdxdAF5X8v_tbL1LvNDXgEPY5veL_OtQv5CrADV9qH4um-g@mail.gmail.com>
From: Roland Ruckerbauer <roland.rucky@gmail.com>
Date: Tue, 1 Nov 2022 23:01:38 +0100
Message-ID: <CAM6WdxfsP13aS62=xWNTFEEzAekAuDwFTpnONP9qF3br-65KWQ@mail.gmail.com>
Subject: Re: [BUG] NULL pointer dereference probably caused by kernel/trace/ring_buffer.c
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org, 
	Takashi Iwai <tiwai@suse.de>, regressions@lists.linux.dev, 
	Steven Noonan <steven.noonan@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Just figured out something, the poll() errors starting at fd 29 (which
is CPU 24).
But I only have 24 cores. Looked at
/sys/kernel/debug/tracing/instances/rasdaemon/per_cpu/, and voila, it
lists 32 cpus not 24.
