Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD557460
	for <regressions@lists.linux.dev>; Fri,  6 Jan 2023 15:38:09 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-4a2f8ad29d5so27240897b3.8
        for <regressions@lists.linux.dev>; Fri, 06 Jan 2023 07:38:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+ZK+xldlBv3g2AO74GvzA01lQCjrDMywdlfRiZz/Z0=;
        b=RhGEO33ZJ/RgJLHuGmQlqW/ByxEma7e+yWT5P7NMyVVQh2YoPM1F3WG+kikJkJelSV
         OcPpcy79uvoAVuwKJbCgU4pBb1H/VeIDon0JZn1/wmg/0shh+OzjBqXFkcXMU0LgoxgU
         EyhNBTON6u25LdvZ1TwSLg8WjjfGfpV8vK0tjmQXNYBHubzBcneUaN9h5JrGbLm5zWLw
         VGaXyHBB28gs8ykXXlDD4TQpoRpa8172uXepROid12dbP2c0/Z3OOqE6m4af0R20XWt7
         sX4uWxYbEetNOb+YL7HEsfmhe9rUoFbnq37m8lzRNPrKbzD5mK5KAgYyYXB8Ox++ii/6
         KH3w==
X-Gm-Message-State: AFqh2kp0vElJZDv4ZRqxdp5nru0oap7gb5DUPGmEQa7gUH6LKzqsHBly
	4alcgCFfYQH/gNahBrbnCGfeMC7nZlHo1g==
X-Google-Smtp-Source: AMrXdXuqaEb9Z7q4LRACa8+biWW40RbhKowxCwdO4IzvjROROh1Ga44bJIjuRCWVOQUSV3WM6KFY1w==
X-Received: by 2002:a05:7500:548f:b0:f0:34c9:a77e with SMTP id z15-20020a057500548f00b000f034c9a77emr222169gab.31.1673019487756;
        Fri, 06 Jan 2023 07:38:07 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id w12-20020a05620a444c00b006f9ddaaf01esm676454qkp.102.2023.01.06.07.38.07
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 07:38:07 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id e76so2216759ybh.11
        for <regressions@lists.linux.dev>; Fri, 06 Jan 2023 07:38:07 -0800 (PST)
X-Received: by 2002:a25:8182:0:b0:75a:6c58:ac5d with SMTP id
 p2-20020a258182000000b0075a6c58ac5dmr6429676ybk.91.1673019486809; Fri, 06 Jan
 2023 07:38:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <14722778-dda0-cb9f-8647-892493d94a5c@leemhuis.info>
 <2026016246ef719605c9932feeb56b105833593b.camel@intel.com>
 <CAMfi-DTwX2nvP58FRb6NaGMyWO0SBo9W=Fpdtr=XfNRzkqAwHw@mail.gmail.com> <b5e9c8911a46802ddb017554f266c92a7a0b2605.camel@intel.com>
In-Reply-To: <b5e9c8911a46802ddb017554f266c92a7a0b2605.camel@intel.com>
From: Dave Chiluk <chiluk@ubuntu.com>
Date: Fri, 6 Jan 2023 09:37:55 -0600
X-Gmail-Original-Message-ID: <CAMfi-DQYU3WQk8x-GFieexEE_enRDe4J0AzyZHk9rtRykpUEnA@mail.gmail.com>
Message-ID: <CAMfi-DQYU3WQk8x-GFieexEE_enRDe4J0AzyZHk9rtRykpUEnA@mail.gmail.com>
Subject: Re: [regression] Bug 216753 - 6e 6 ghz bands are disabled since 5.16
 on intel ax211
To: "Greenman, Gregory" <gregory.greenman@intel.com>
Cc: "Coelho, Luciano" <luciano.coelho@intel.com>, 
	"regressions@leemhuis.info" <regressions@leemhuis.info>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "marcel@holtmann.org" <marcel@holtmann.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 5, 2023 at 12:15 AM Greenman, Gregory
<gregory.greenman@intel.com> wrote:
>
> I'll try to explain, the problem here is not technical. After some
> internal checks, it appears that we (wifi driver) aren't allowed to
> decide if 6E should be enabled or not. Because of the legal restrictions,
> OEM should make this decision and enable/disable 6E in the BIOS. This
> commit only gets the value from the BIOS and configures the firmware
> accordingly. So, unfortunately, legal restriction is the reason we cannot
> revert/overwrite 6E enablement...
>
Thank you Gregory, I've been reading between the lines, and this is
pretty much what I expected you to say.  So in the past when
OEMs/systems manufacturers have been irresponsible/inept like this we
have implemented flags to force ignore the values coming out of the
bios.  As it's now obvious that the problem here is a legal/regulatory
issue, I'd hope that having a force flag would be acceptable from a
that perspective.  I'm no lawyer, but I expect once a user decides to
explicitly set a force flag to ignore the bios values I'd suspect the
responsibility would shift from the manufacturers and back onto the
user.

Would such a patch be theoretically acceptable?  If so I'll write up a
patch to do this and submit it next week hopefully.
