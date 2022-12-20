Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415A77E
	for <regressions@lists.linux.dev>; Tue, 20 Dec 2022 11:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671536495; x=1703072495;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=OhLxX3BrNlCDxRWA4Q0Y3wDHz6GSXqLm/UxFiiwiB48=;
  b=aQlWFzmq2ulyuBbjKJ3YQe3eF/1TbvuO6NvFVy6ySPPMYch42AZBbMp7
   V5OG/U0t3h5xx66AOf8PUURcK4ZxMxxI0w3QyuLhs6tnnIQ2z60nUqgtF
   MQEPnbbTqMV6l7R/fw7JvW2v0lr5WX3VaBkhvHufVxa8FHLEM8/lF9ff3
   oh2GaFMiiLsMU9ykL2iMv5iZBV5Yf94n7kbOT2Y9MQsDVzb4FJ9nyRN4u
   Zbue7a2sXbYYAl389zjqWroeZPm2hlPS5LtIQNDv0qwrUM/dxm698Js1i
   v5xeramfVh9oDVQdfwEYT3YLl0jihXUTk8o4TnSI0LbksiHL1iKqp4A2W
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="381815499"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="381815499"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 03:41:34 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="601031193"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="601031193"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 03:41:30 -0800
Date: Tue, 20 Dec 2022 13:41:01 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Mark Brown <broonie@kernel.org>, 
    Thorsten Leemhuis <regressions@leemhuis.info>
cc: Alsa-devel <alsa-devel@alsa-project.org>, 
    Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
    yung-chuan.liao@linux.intel.com, Takashi Iwai <tiwai@suse.de>, 
    daniel.baluta@nxp.com, Oliver Neukum <oneukum@suse.com>, 
    lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com, 
    Zhen Ni <nizhen@uniontech.com>, ranjani.sridharan@linux.intel.com, 
    Ricardo Ribalda <ribalda@chromium.org>, 
    Archana Patni <archana.patni@intel.com>, peter.ujfalusi@linux.intel.com, 
    "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [PATCH 0/2] ASoC: SOF: remove unregister calls from shutdown
In-Reply-To: <Y6BhTWGUp2D5hhbE@sirena.org.uk>
Message-ID: <alpine.DEB.2.22.394.2212201334340.3532114@eliteleevi.tm.intel.com>
References: <20221209114529.3909192-1-kai.vehmanen@linux.intel.com> <167102472177.27755.10161077455234852195.b4-ty@kernel.org> <e23ec080-9fe4-ee28-1d4c-879127803660@leemhuis.info> <Y6BhTWGUp2D5hhbE@sirena.org.uk>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi,

On Mon, 19 Dec 2022, Mark Brown wrote:

> On Mon, Dec 19, 2022 at 10:41:41AM +0100, Thorsten Leemhuis wrote:
> 
> > * there are no "CC: <stable..." tags in these patches. Is the plan to
> > manually ask for a backport? Or how can we get the regression fixed in
> > older releases?
> 
> Speak to the stable maintainers I guess, or hope their bot picks the
> commits up.

thanks Thorsten for the notice. These patches do lack the "Fixes:" tag, so 
it's possible the bots will not pick these up. I can follow up and send 
these to stable if this does not happen.

Br, Kai
