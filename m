Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8106A4404
	for <regressions@lists.linux.dev>; Wed, 17 Aug 2022 14:04:11 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id kb8so24743295ejc.4
        for <regressions@lists.linux.dev>; Wed, 17 Aug 2022 07:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=mVA/ftXBTRCBqAVa0b4WI+Q+4R86Al02EQrIzwFas0I=;
        b=H1AdnNX81zvb6+L8fW//LUTu29uCpX5rrHVQnNIjXBnoNObrjbsS/BFGBBweZ4ECBj
         M8bP0rAmYtgGiu4WEbiutnmtaTcRtAUVFGVdFAmyWTW2vLCoSeYRFRg+VDn5eEg9/j7G
         dFmJxLI+rcH8IJVzvXgFLEOOVd4SsaXzNeDBylxew5RM4DqZkVmrruaImlXZLiXgXGh3
         7HbUVn2s/xOGaWZ6D4FZRs5qlDAbpuO9Ul2QZO8y+rrnDl10HOBdoCRXWqq8by95P4mB
         h5v+VxAayq1wcO4X5uXvuJbK414v0QNF8+FMgYDMRWY6CxuCiOOnSp/gJr9nWmGNcVIf
         J0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=mVA/ftXBTRCBqAVa0b4WI+Q+4R86Al02EQrIzwFas0I=;
        b=ZHkwCwy7tEq9WR1zO5urrpQeWltQoeKYzhp336Svun77TkhbOERYEUoDOa03BqaCY5
         h1RCGG3caf6/TUDr51+k8+hiQNx07rfkFPRY+TkxSkNP8JtgeauA2pHfyShI/fJQ+Y1p
         Ah4f2Onci3dSQHLsO8yQD9JadVxzQAxmk8WdhnINnRei6qtdFXkMS5bjDE5CzUE15kZq
         grlNkn8joq/AMtE0OzhObbTuFCC2gwKcuIi6XIzPw013/DkS/ExjQJdwKxOA4oC2scun
         37Akgcu7mf5OUpD+yRJD7ArXPJEgZWxiTnlpKoQaXLI1qNet9gzPuUtXjObGHKa+vcX3
         9qFg==
X-Gm-Message-State: ACgBeo1lDHsfMmBWYaqOynxRCqF2SDQuV/teIuCGM4F+rwWBf4S1QNl4
	b510WsA9IJYwNd9NPlYs+5w=
X-Google-Smtp-Source: AA6agR4Gr1kT8N8Cpa3HrWj57nzy+YqMeq/pGIXlwFucDMek9b8qasF3juwXGravWpuNfEajv5OWeQ==
X-Received: by 2002:a17:907:3ea9:b0:738:dac0:371e with SMTP id hs41-20020a1709073ea900b00738dac0371emr4953803ejc.455.1660745049633;
        Wed, 17 Aug 2022 07:04:09 -0700 (PDT)
Received: from skbuf ([188.26.184.170])
        by smtp.gmail.com with ESMTPSA id e6-20020a1709061e8600b006fec4ee28d0sm6678060ejj.189.2022.08.17.07.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 07:04:08 -0700 (PDT)
Date: Wed, 17 Aug 2022 17:04:06 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	LKML <linux-kernel@vger.kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	netdev <netdev@vger.kernel.org>, craig@mcqueen.id.au,
	UNGLinuxDriver@microchip.com,
	Arun Ramadoss <arun.ramadoss@microchip.com>
Subject: Re: Bug 216320 - KSZ8794 operation broken
Message-ID: <20220817140406.jqv72rkpro5gmgvu@skbuf>
References: <967ef480-2fac-9724-61c7-2d5e69c26ec3@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <967ef480-2fac-9724-61c7-2d5e69c26ec3@leemhuis.info>

On Wed, Aug 17, 2022 at 03:36:44PM +0200, Thorsten Leemhuis wrote:
> I noticed a regression report in bugzilla.kernel.org that afaics nobody
> acted upon since it was reported. That's why I decided to forward it by
> mail to those that afaics should handle this.

Thanks. I don't track bugzilla, but I will respond to this ticket.
Is there a way to get automatically notified of DSA related issues?
