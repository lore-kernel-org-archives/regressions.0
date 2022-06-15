Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7367A
	for <regressions@lists.linux.dev>; Wed, 15 Jun 2022 15:29:38 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id v12so2452946qvh.9
        for <regressions@lists.linux.dev>; Wed, 15 Jun 2022 08:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oOUOcgst0LKLvdZ4y1qA+jD7xbPureSESBaUterAPeQ=;
        b=keEYO+UKUGnDg/3yQdo//1YG/vB5zkaL+gy+QJG/aV5dmINQy4Sgft+De46wYQY/4i
         oIA7IxoLqB0b7iU4pzMek0+ASaZgDmvH8dIH8i7uCynAPK9/XJzZ/+4yBSVerIEAmb5a
         PSpXMl1gp+qqFQLhuyH7uouj1TkEvHjXK/SHie3oy1Ct/RkVVztdZkOslJSWDR1541Em
         LRyx1iZeahm97Fk9WxQ5AX82dsg6/C568N/YgqKaCB7jvGdTL6ZgQaQUdMzQXXgewPcl
         LFBuKgTAE5YYFEtwahg+S9rOh38E1SWSQjEYb97RwdVYX1zjkd1s0t6f3u16SC+VgggU
         cJ7Q==
X-Gm-Message-State: AJIora83p1DDTg6Hs2+3y85H4utwBQCzblrugoMY38CTgDRcIujKFl46
	9ilyDcV+1IXyyMA+106T5YPcfUQNfXWB
X-Google-Smtp-Source: AGRyM1udyvePyABL3hVV3lkzQhfydZn0wmJrxJ9zo1e7WcUiTeQdcq2H4C9hLV+9rcwDXfakoleMEg==
X-Received: by 2002:a05:6214:5199:b0:464:58c0:3926 with SMTP id kl25-20020a056214519900b0046458c03926mr282092qvb.48.1655306977430;
        Wed, 15 Jun 2022 08:29:37 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net. [68.160.176.52])
        by smtp.gmail.com with ESMTPSA id bk12-20020a05620a1a0c00b006a70f581243sm12307395qkb.93.2022.06.15.08.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 08:29:36 -0700 (PDT)
Date: Wed, 15 Jun 2022 11:29:36 -0400
From: Mike Snitzer <snitzer@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Greg KH <gregkh@linuxfoundation.org>, keescook@chromium.org,
	sarthakkukreti@google.com, Mike Snitzer <snitzer@kernel.org>,
	stable@vger.kernel.org, Oleksandr Tymoshenko <ovt@google.com>,
	dm-devel@redhat.com, regressions@lists.linux.dev
Subject: Re: [PATCH 5.4 26/34] dm verity: set DM_TARGET_IMMUTABLE feature flag
Message-ID: <Yqn64AMwoIzQXwXM@redhat.com>
References: <20220603173816.944766454@linuxfoundation.org>
 <20220610042200.2561917-1-ovt@google.com>
 <YqLTV+5Q72/jBeOG@kroah.com>
 <YqNfBMOR9SE2TuCm@redhat.com>
 <Yqb/sT205Lrhl6Bv@kroah.com>
 <20220615143642.GA2386944@roeck-us.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615143642.GA2386944@roeck-us.net>

On Wed, Jun 15 2022 at 10:36P -0400,
Guenter Roeck <linux@roeck-us.net> wrote:

> On Mon, Jun 13, 2022 at 11:13:21AM +0200, Greg KH wrote:
> > On Fri, Jun 10, 2022 at 11:11:00AM -0400, Mike Snitzer wrote:
> > > On Fri, Jun 10 2022 at  1:15P -0400,
> > > Greg KH <gregkh@linuxfoundation.org> wrote:
> > > 
> > > > On Fri, Jun 10, 2022 at 04:22:00AM +0000, Oleksandr Tymoshenko wrote:
> > > > > I believe this commit introduced a regression in dm verity on systems
> > > > > where data device is an NVME one. Loading table fails with the
> > > > > following diagnostics:
> > > > > 
> > > > > device-mapper: table: table load rejected: including non-request-stackable devices
> > > > > 
> > > > > The same kernel works with the same data drive on the SCSI interface.
> > > > > NVME-backed dm verity works with just this commit reverted.
> > > > > 
> > > > > I believe the presence of the immutable partition is used as an indicator
> > > > > of special case NVME configuration and if the data device's name starts
> > > > > with "nvme" the code tries to switch the target type to
> > > > > DM_TYPE_NVME_BIO_BASED (drivers/md/dm-table.c lines 1003-1010).
> > > > > 
> > > > > The special NVME optimization case was removed in
> > > > > 5.10 by commit 9c37de297f6590937f95a28bec1b7ac68a38618f, so only 5.4 is
> > > > > affected.
> > > > > 
> > > > 
> > > > Why wouldn't 4.9, 4.14, and 4.19 also be affected here?  Should I also
> > > > just queue up 9c37de297f65 ("dm: remove special-casing of bio-based
> > > > immutable singleton target on NVMe") to those older kernels?  If so,
> > > > have you tested this and verified that it worked?
> > > 
> > > Sorry for the unforeseen stable@ troubles here!
> > > 
> > > In general we'd be fine to apply commit 9c37de297f65 but to do it
> > > properly would require also making sure commits that remove
> > > "DM_TYPE_NVME_BIO_BASED", like 8d47e65948dd ("dm mpath: remove
> > > unnecessary NVMe branching in favor of scsi_dh checks") are applied --
> > > basically any lingering references to DM_TYPE_NVME_BIO_BASED need to
> > > be removed.
> > > 
> > > The commit header for 8d47e65948dd documents what
> > > DM_TYPE_NVME_BIO_BASED was used for.. it was dm-mpath specific and
> > > "nvme" mode really never got used by any userspace that I'm aware of.
> > > 
> > > Sadly I currently don't have the time to do this backport for all N
> > > stable kernels... :(
> > > 
> > > But if that backport gets out of control: A simpler, albeit stable@
> > > unicorn, way to resolve this is to simply revert 9c37de297f65 and make
> 
> 9c37de297f65 can not be reverted in 5.4 and older because it isn't there,
> and trying to apply it results in conflicts which at least I can not
> resolve.
> 
> > > it so that DM-mpath and DM core just used bio-based if "nvme" is
> > > requested by dm-mpath, so also in drivers/md/dm-mpath.c e.g.:
> > > 
> > > @@ -1091,8 +1088,6 @@ static int parse_features(struct dm_arg_set *as, struct multipath *m)
> > > 
> > >                         if (!strcasecmp(queue_mode_name, "bio"))
> > >                                 m->queue_mode = DM_TYPE_BIO_BASED;
> > > 			else if (!strcasecmp(queue_mode_name, "nvme"))
> > > -                               m->queue_mode = DM_TYPE_NVME_BIO_BASED;
> > > +                               m->queue_mode = DM_TYPE_BIO_BASED;
> > >                         else if (!strcasecmp(queue_mode_name, "rq"))
> > >                                 m->queue_mode = DM_TYPE_REQUEST_BASED;
> > >                         else if (!strcasecmp(queue_mode_name, "mq"))
> > > 
> > > Mike
> > > 
> > 
> > Ok, please submit a working patch for the kernels that need it so that
> > we can review and apply it to solve this regression.
> > 
> 
> So, effectively, v5.4.y and older are broken right now for use cases
> with dm on NVME drives.
> 
> Given that the regression does affect older branches, and given that we
> have to revert this patch to avoid regressions in ChromeOS, would it be
> possible to revert it from v5.4.y and older until a fix is found ?

I obviously would prefer to not have this false-start.

I'll look at latest 5.4.y _now_ and see what can be done.

Should hopefully be pretty straight-forward.

Mike
