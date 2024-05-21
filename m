Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAAB74BF0
	for <regressions@lists.linux.dev>; Tue, 21 May 2024 17:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716313198; cv=none; b=IKUhkFQf5LmgYMs4HrnITBYrNcQPkb0q20bLQrLYsZjNNxhURA7gqyfsTva8hMcNEJLdyZhEttr9/GvisVEoB6z/GADRUAdmIy4K0TTGfVdBdMRZRfE3uHU/3o+X65kTljWCTNLwjIMbrhz2WBKs2PvqIMMVFq7qp6feHaENB/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716313198; c=relaxed/simple;
	bh=W1k/b9TMg5vla0eOH4Ow5cEjMyecb29EOdgXPHJp1FM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RmWJcpTepuuv2m2YDxMeJq1UHI6D1p38BcmQBxNAglugqYRMWf69c1UrmGqTzEI5RipnV2urMF6y0PJgpFDsrCA0Y/kxMhE6oMwn2HXxLLNmEAPfWrOiDSMRGL9W3e0aZ+eZOfHNzqvdxmcWEfAmABCMnpnXy4692FIzEqDK8s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InqyTCI8; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InqyTCI8"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-66afccbee0cso475756a12.1
        for <regressions@lists.linux.dev>; Tue, 21 May 2024 10:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716313196; x=1716917996; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6naY1ebYgtBqBr6FtFx0JuqKFL0i54ZhF9HoediEIY=;
        b=InqyTCI89fil8u+C6RZLpDhillGAxUJxhG7xwEAwcMtUp5j7nQGrOs+e9BotYkYbyA
         1P5x+JGWjSqzTccIfUGzJCwB7vqQBWHeoQu+zGeoQkVLGdoyeDk02vlJnFLEIE3xjUOz
         WqbOGL+/qyK+5ZaWXI0yfPVG+NUoB4jFVjZ3QHcEIQtjpRLU0gFngDcMhzEaJ3+0mJKO
         P1yLHj5qkImIa0tfwhBOJcTceVUCtpjG13bCD+AaRO1lk0YVpVvgJ/T3UAHS7OH5zOaI
         fja/qlX3VThD75oX/h0sOVgPR2Deqvx5rM2E73yQnHeZhSFdOb2AJPrX6AF2GWS5fqIW
         yMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716313196; x=1716917996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6naY1ebYgtBqBr6FtFx0JuqKFL0i54ZhF9HoediEIY=;
        b=YWEGuDI3JxzKw8xGPiK207yJyp0bYfyLFU1vYawJyZo+5p+7kGWak6T8hvU3k9fVNX
         rtI3Tl5uBAgz0xrXfHZcWSyheyA0hcQonBIU2216Rj7W7o6e21VHIId3Teucua+h4zSV
         vSVsZyqxM7KCpq7uz/fULgQCXNpAv7fFR1ciqLJfPh1bkOTKlSVpBZjWnWZZ+LAJ6u0N
         sneqN6JJUWsCVSSYIEqBvRHNBRdtvjE7W0kBiow2qCMRBkLG/7B84f/94ziFUSJxlxjY
         0E/abcJWU7b+8KdeBQ10UKVsrYSley2GyXiM7vuLtAxRATJ4IsTL2i+eSj6cGUyCalhQ
         fvSw==
X-Gm-Message-State: AOJu0Yx1Knx2XwG7CP274xG/56r+grYgR8kpPgYBSt7QPK/yN0rYcZzd
	JNTSvCuSKSvlAjcfLPGoc7bQvX82sWjpOoSEOpo6lXoWyqr5s9VlsOUnf+3zMBhhxbq1kT0pgoy
	XOhl6g4wGHwRQFYHc6x5rEB5wI/2wdL/5
X-Google-Smtp-Source: AGHT+IEtIwnLHEJom7EzPs7RT34MstjtZMfmyW9DXLDXYepTOE0snpQgoUF0SiAcYhvLERYK6iuAIEpcIVtspvvn1Wc=
X-Received: by 2002:a17:90a:fd8a:b0:2bc:9bce:19c3 with SMTP id
 98e67ed59e1d1-2bc9bce1df0mr12631794a91.43.1716313195890; Tue, 21 May 2024
 10:39:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240307062957.2323620-1-Wayne.Lin@amd.com> <0847dc03-c7db-47d7-998b-bda2e82ed442@amd.com>
 <41b87510-7abf-47e8-b28a-9ccc91bbd3c1@leemhuis.info> <177cfae4-b2b5-4e2c-9f1e-9ebe262ce48c@amd.com>
 <CO6PR12MB5489FA9307280A4442BAD51DFCE72@CO6PR12MB5489.namprd12.prod.outlook.com>
 <87wmo2hver.fsf@intel.com> <6f66e479-2f5a-477a-9705-dca4a3606760@amd.com>
 <83df4e94-e1ec-42f6-8a15-6439ef4a25b7@leemhuis.info> <CADnq5_P+WsL8B6B2vK5ENe8VWdvheoHyxoUfgF3Oex8Gvp7Lbg@mail.gmail.com>
In-Reply-To: <CADnq5_P+WsL8B6B2vK5ENe8VWdvheoHyxoUfgF3Oex8Gvp7Lbg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 21 May 2024 13:39:44 -0400
Message-ID: <CADnq5_MYDNBpqXT8snztEGxqHh3N8_7wktNdjedkjnhe1Te6CQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mst: Fix NULL pointer dereference at drm_dp_add_payload_part2
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: "Limonciello, Mario" <mario.limonciello@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	"Lin, Wayne" <Wayne.Lin@amd.com>, "Wentland, Harry" <Harry.Wentland@amd.com>, 
	"lyude@redhat.com" <lyude@redhat.com>, "imre.deak@intel.com" <imre.deak@intel.com>, 
	=?UTF-8?Q?Leon_Wei=C3=9F?= <leon.weiss@ruhr-uni-bochum.de>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and pushed out:
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D8a0a7b98d4b6eeeab337=
ec25daa4bc0a5e710a15

Alex

On Tue, May 21, 2024 at 12:12=E2=80=AFPM Alex Deucher <alexdeucher@gmail.co=
m> wrote:
>
> I've got it teed up.  Is drm-misc-fixes the right branch since we are
> in the merge window?
>
> Alex
>
> On Tue, May 21, 2024 at 7:20=E2=80=AFAM Linux regression tracking (Thorst=
en
> Leemhuis) <regressions@leemhuis.info> wrote:
> >
> > Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> > for once, to make this easily accessible to everyone.
> >
> > Hmm, from here it looks like the patch now that it was reviewed more
> > that a week ago is still not even in -next. Is there a reason?
> >
> > I know, we are in the merge window. But at the same time this is a fix
> > (that already lingered on the lists for way too long before it was
> > reviewed) for a regression in a somewhat recent kernel, so it in Linus
> > own words should be "expedited"[1].
> >
> > Or are we again just missing a right person for the job in the CC?
> > Adding Dave and Sima just in case.
> >
> > Ciao, Thorsten
> >
> > [1]
> > https://lore.kernel.org/all/CAHk-=3Dwis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wm=
B6SRUwQUBQ@mail.gmail.com/
> >
> > On 12.05.24 18:11, Limonciello, Mario wrote:
> > > On 5/10/2024 4:24 AM, Jani Nikula wrote:
> > >> On Fri, 10 May 2024, "Lin, Wayne" <Wayne.Lin@amd.com> wrote:
> > >>>> -----Original Message-----
> > >>>> From: Limonciello, Mario <Mario.Limonciello@amd.com>
> > >>>> Sent: Friday, May 10, 2024 3:18 AM
> > >>>> To: Linux regressions mailing list <regressions@lists.linux.dev>;
> > >>>> Wentland, Harry
> > >>>> <Harry.Wentland@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>
> > >>>> Cc: lyude@redhat.com; imre.deak@intel.com; Leon Wei=C3=9F
> > >>>> <leon.weiss@ruhr-uni-
> > >>>> bochum.de>; stable@vger.kernel.org; dri-devel@lists.freedesktop.or=
g;
> > >>>> amd-
> > >>>> gfx@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > >>>> Subject: Re: [PATCH] drm/mst: Fix NULL pointer dereference at
> > >>>> drm_dp_add_payload_part2
> > >>>>
> > >>>> On 5/9/2024 07:43, Linux regression tracking (Thorsten Leemhuis) w=
rote:
> > >>>>> On 18.04.24 21:43, Harry Wentland wrote:
> > >>>>>> On 2024-03-07 01:29, Wayne Lin wrote:
> > >>>>>>> [Why]
> > >>>>>>> Commit:
> > >>>>>>> - commit 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload
> > >>>>>>> allocation/removement") accidently overwrite the commit
> > >>>>>>> - commit 54d217406afe ("drm: use mgr->dev in drm_dbg_kms in
> > >>>>>>> drm_dp_add_payload_part2") which cause regression.
> > >>>>>>>
> > >>>>>>> [How]
> > >>>>>>> Recover the original NULL fix and remove the unnecessary input
> > >>>>>>> parameter 'state' for drm_dp_add_payload_part2().
> > >>>>>>>
> > >>>>>>> Fixes: 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload
> > >>>>>>> allocation/removement")
> > >>>>>>> Reported-by: Leon Wei=C3=9F <leon.weiss@ruhr-uni-bochum.de>
> > >>>>>>> Link:
> > >>>>>>> https://lore.kernel.org/r/38c253ea42072cc825dc969ac4e6b9b600371=
cc8.c
> > >>>>>>> amel@ruhr-uni-bochum.de/
> > >>>>>>> Cc: lyude@redhat.com
> > >>>>>>> Cc: imre.deak@intel.com
> > >>>>>>> Cc: stable@vger.kernel.org
> > >>>>>>> Cc: regressions@lists.linux.dev
> > >>>>>>> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> > >>>>>>
> > >>>>>> I haven't been deep in MST code in a while but this all looks pr=
etty
> > >>>>>> straightforward and good.
> > >>>>>>
> > >>>>>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> > >>>>>
> > >>>>> Hmmm, that was three weeks ago, but it seems since then nothing
> > >>>>> happened to fix the linked regression through this or some other
> > >>>>> patch. Is there a reason? The build failure report from the CI ma=
ybe?
> > >>>>
> > >>>> It touches files outside of amd but only has an ack from AMD.  I
> > >>>> think we
> > >>>> /probably/ want an ack from i915 and nouveau to take it through.
> > >>>
> > >>> Thanks, Mario!
> > >>>
> > >>> Hi Thorsten,
> > >>> Yeah, like what Mario said. Would also like to have ack from i915 a=
nd
> > >>> nouveau.
> > >>
> > >> It usually works better if you Cc the folks you want an ack from! ;)
> > >>
> > >> Acked-by: Jani Nikula <jani.nikula@intel.com>
> > >>
> > >
> > > Thanks! Can someone with commit permissions take this to drm-misc?
> > >
> > >
> > >
